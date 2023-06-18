# == Schema Information
#
# Table name: cards
#
#  id                :bigint           not null, primary key
#  activation_number :string
#  amount_cents      :integer          default(0), not null
#  amount_currency   :string           default("USD"), not null
#  status            :integer          default("available")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :integer
#
require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'assocications' do
    it { should belong_to(:product) }
    it { should have_one(:card_transaction) }
    it { is_expected.to monetize(:amount) }

  end

  describe 'validations' do
    let(:card) { create(:card) }
    it 'is invalid without amount' do
      card.amount_cents = nil
      expect(card).to_not be_valid
    end
    it 'is invalid with same activtion number' do
      new_card = build(:card, activation_number: card.activation_number)
      expect(new_card).to_not be_valid
    end
    it 'is valid with valid attributes' do
      card = build(:card, amount: Faker::Number.between(from: 10_000, to: 1_000_000),
                          activation_number: Faker::Alphanumeric.alphanumeric(number: 10) )
      expect(card).to be_valid
    end
  end
  
  describe 'method' do
    let(:client) { create(:client) }
    let(:merchant) { create(:merchant) }
    let(:application) { create(:application, client: client) }
    let(:brand) { create(:brand, merchant: merchant) }
    let(:product) { create(:product,  brand: brand) }
    let(:card) { create(:card, product: product) }

    it 'should return client payout rate as current client' do
      expect(card.send(:client_payout_rate, application.id)).to eq client.payout_rate.to_d
    end

    it 'should return merchant payout rate as merchant' do
      expect(card.send(:merchant_payout_rate)).to eq merchant.payout_rate.to_d
    end

    it 'should generate uniqueness activation number after create' do
      new_card = create(:card, product: product)

      expect(new_card.activation_number).not_to be_nil
      expect(new_card.activation_number).not_to eq card.activation_number
    end

    it 'should return correct client amount' do
      expected_amount = client.payout_rate * card.amount / 100
      expect(card.client_amount(application.id)).to eq expected_amount
    end

    it 'should return correct merchant amount' do
      expected_amount = merchant.payout_rate * card.amount / 100
      expect(card.merchant_amount).to eq expected_amount
    end
  end
end

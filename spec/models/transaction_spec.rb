# == Schema Information
#
# Table name: transactions
#
#  id                       :bigint           not null, primary key
#  client_amount_cents      :integer          default(0), not null
#  client_amount_currency   :string           default("USD"), not null
#  merchant_amount_cents    :integer          default(0), not null
#  merchant_amount_currency :string           default("USD"), not null
#  reference_number         :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  application_id           :integer
#  card_id                  :integer
#
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { should belong_to(:application) }
    it { should belong_to(:card) }
    it { is_expected.to monetize(:client_amount) }
    it { is_expected.to monetize(:merchant_amount) }
  end

  describe 'validations' do
    let(:transaction) { create(:transaction) }
    it 'is invalid without reference number' do
      transaction.reference_number = nil
      expect(transaction).to_not be_valid
    end
    it 'is invalid without client amount' do
      transaction.client_amount_cents = nil
      expect(transaction).to_not be_valid
    end
    it 'is invalid without merchant amount' do
      transaction.merchant_amount_cents = nil
      expect(transaction).to_not be_valid
    end
    it 'is invalid with same reference number' do
      new_transaction = build(:transaction, reference_number: transaction.reference_number)
      expect(new_transaction).to_not be_valid
    end
    it 'is valid with valid attributes' do
      transaction = build(:transaction, reference_number: Faker::Alphanumeric.alphanumeric(number: 10),
                                        merchant_amount: Faker::Number.between(from: 10_000, to: 1_000_000),
                                        client_amount: Faker::Number.between(from: 10_000, to: 1_000_000))
      expect(transaction).to be_valid
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

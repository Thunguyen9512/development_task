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
    it { should have_many(:transactions) } 
  end

  describe 'validations' do
    let(:card) { create(:card) }
    it 'is invalid without amount' do
      card.amount = nil
      expect(card).to_not be_valid
    end
    it 'is invalid without activation number' do
      card.activation_number = nil
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
end

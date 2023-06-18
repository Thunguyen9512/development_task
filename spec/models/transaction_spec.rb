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
  end

  describe 'validations' do
    let(:transaction) { create(:transaction) }
    it 'is invalid without reference number' do
      transaction.reference_number = nil
      expect(transaction).to_not be_valid
    end
    it 'is invalid without client amount' do
      transaction.client_amount = nil
      expect(transaction).to_not be_valid
    end
    it 'is invalid without merchant amount' do
      transaction.merchant_amount = nil
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
end

# == Schema Information

#
# Table name: merchants
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  name        :string
#  payout_rate :decimal(5, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  country_id  :integer
#
require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'associations' do
    it { should belong_to(:country) }
    it { should have_many(:brands) }
  end

  describe 'validations' do
    let!(:country) { create(:country) }
    let(:merchant) { create(:merchant) }
    it 'is invalid without name' do
      merchant.name = nil
      expect(merchant).to_not be_valid
    end
    it 'is invalid with same name' do
      new_merchant = build(:merchant, name: merchant.name)
      expect(new_merchant).to_not be_valid
    end
    it 'is valid with valid attributes' do
      merchant = build(:merchant, name: Faker::Company.name, country: Country.first)
      expect(merchant).to be_valid
    end
  end
end
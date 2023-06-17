# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  currency   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'associations' do
    it { should have_many(:clients) }
    it { should have_many(:merchants) }
  end
  describe 'validations' do
    let(:country) { create(:country) }
    it 'is invalid without name' do
      country.name = nil
      expect(country).to_not be_valid
    end
    it 'is invalid with same name' do
      new_country = build(:country, name: country.name)
      expect(new_country).to_not be_valid
    end
    it 'is invalid without currency' do
      new_country = build(:country, currency: nil)
      expect(new_country).to_not be_valid
    end
    it 'is invalid with same currency' do
      new_country = build(:country, currency: country.currency)
      expect(new_country).to_not be_valid
    end
    it 'is valid with valid attributes' do
      build(:country, name: Faker::Address.country, currency: Faker::Currency.name)
      expect(country).to be_valid
    end
  end
end

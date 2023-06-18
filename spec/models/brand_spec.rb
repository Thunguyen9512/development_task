# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  description :text
#  name        :string
#  redemption  :integer          default("instore")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :integer
#
require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe 'associations' do
    it { should belong_to(:merchant) }
    it { should have_many(:products) }
  end

  describe 'validations' do
    let!(:merchant) { create(:merchant) }
    let(:brand) { create(:brand) }
    it 'is invalid without name' do
      brand.name = nil
      expect(brand).to_not be_valid
    end
    it 'is invalid with same name' do
      new_brand = build(:brand, name: brand.name)
      expect(new_brand).not_to be_valid
    end
    it 'is valid with valid attributes' do 
      brand = build(:brand, name: Faker::Vehicle.manufacture, merchant: merchant)
      expect(brand).to be_valid
    end
  end

  describe 'methods' do
    let(:brand) { create(:brand) }
    let(:active_product) { create(:product, brand: brand, active: true) }
    let(:inactive_product) { create(:product, brand: brand, active: false) }
    it 'should return active products only' do
      expect(brand.active_products).to include(active_product)
      expect(brand.active_products).not_to include(inactive_product)
    end
  end
end

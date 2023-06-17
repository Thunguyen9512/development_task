# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  amount     :decimal(10, 2)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :integer
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:brand) }
    it { should have_many(:cards) }
  end

  describe 'validations' do
    let(:product) { create(:product) }
    it 'is invalid without name' do
      product.name = nil
      expect(product).to_not be_valid
    end
    it 'is invalid without amount' do
      product.amount = nil
      expect(product).to_not be_valid
    end
    it 'is valid with valid attributes' do
      product = build(:product, name: Faker::Vehicle.model,
                                amount: Faker::Number.between(from: 10_000, to: 1_000_000))
      expect(product).to be_valid
    end

  end
end

# == Schema Information
#
# Table name: cards
#
#  id                :bigint           not null, primary key
#  activation_number :string
#  amount            :decimal(10, 2)
#  status            :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :integer
#
FactoryBot.define do
  factory :card do
    status { 'available' }
    amount { Faker::Number.between(from: 10_000, to: 1_000_000) }
    activation_number { Faker::Alphanumeric.alphanumeric(number: 10) }
    product
  end
end

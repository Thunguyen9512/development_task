# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  amount_cents    :integer          default(0), not null
#  amount_currency :string           default("USD"), not null
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :integer
#
FactoryBot.define do
  factory :product do
    name { Faker::Vehicle.model }
    amount { Faker::Number.between(from: 10_000, to: 1_000_000) }
    brand
  end
end

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
FactoryBot.define do
  factory :transaction do
    reference_number { Faker::Alphanumeric.alphanumeric(number: 10) }
    merchant_amount { Faker::Number.between(from: 10_000, to: 1_000_000) }
    client_amount { Faker::Number.between(from: 10_000, to: 1_000_000) }
    application
    card
  end
end

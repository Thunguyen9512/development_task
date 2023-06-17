# == Schema Information
#
# Table name: applications
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  secret     :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer
#
FactoryBot.define do
  factory :application do
    name { Faker::Name.name }
    uid { Faker::Alphanumeric.alphanumeric(number: 10) }
    secret { Faker::Internet.password }
    client
  end
end

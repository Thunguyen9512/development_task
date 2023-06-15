# == Schema Information
#
# Table name: clients
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  name        :string
#  payout_rate :decimal(5, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  country_id  :integer
#
FactoryBot.define do
  factory :client do
    
  end
end

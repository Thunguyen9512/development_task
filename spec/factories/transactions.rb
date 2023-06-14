# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  client_amount    :decimal(10, 2)
#  merchant_amount  :decimal(10, 2)
#  reference_number :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  application_id   :integer
#  card_id          :integer
#
FactoryBot.define do
  factory :transaction do
    
  end
end

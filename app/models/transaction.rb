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
class Transaction < ApplicationRecord
  belongs_to :application
  belongs_to :card

  validates :reference_number, uniqueness: true, presence: true
  validates :client_amount, presence: true
  validates :merchant_amount, presence: true
end

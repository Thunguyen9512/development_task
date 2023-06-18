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
class Transaction < ApplicationRecord
  belongs_to :application
  belongs_to :card

  monetize :merchant_amount_cents, :client_amount_cents

  validates :reference_number, uniqueness: true, presence: true
  validates :merchant_amount_cents, presence: true
  validates :client_amount_cents, presence: true
end

# == Schema Information
#
# Table name: cards
#
#  id                :bigint           not null, primary key
#  activation_number :string
#  amount_cents      :integer          default(0), not null
#  amount_currency   :string           default("USD"), not null
#  status            :integer          default("available")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :integer
#
class Card < ApplicationRecord
  belongs_to :product
  has_one :card_transaction, class_name: 'Transaction'

  ACTIVATION_PREFIX = 'TN204S125FG'.freeze

  monetize :amount_cents

  validates :activation_number, uniqueness: true

  after_create :generate_activation_number

  enum status: { available: 0, issued: 1 }

  def client_amount(app_id)
    (client_payout_rate(app_id) * amount) / 100
  end

  def merchant_amount
    (merchant_payout_rate * amount) / 100
  end

  private

  def client_payout_rate(application_id)
    application = Application.find_by(id: application_id)
    application&.client&.payout_rate&.to_d
  end

  def merchant_payout_rate
    product&.brand&.merchant&.payout_rate&.to_d
  end

  def generate_activation_number
    self.activation_number = "#{ACTIVATION_PREFIX}-#{product_id}-#{id}"
    save
  end
end

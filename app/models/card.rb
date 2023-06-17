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
class Card < ApplicationRecord
  belongs_to :product
  has_one :card_transaction, class_name: 'Transaction'

  ACTIVATION_PREFIX = "TN204S125FG"

  validates :amount, presence: true
  validates :activation_number, uniqueness: true

  after_create :generate_activation_number

  enum status: { available: 0, issued: 1 }

  def client_amount
    50
  end

  def merchant_amount
    50
  end

  private

  def generate_activation_number
    self.activation_number = "#{ACTIVATION_PREFIX}-#{product_id}-#{id}"
    save
  end


end

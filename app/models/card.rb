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
  has_many :transactions

  validates :amount, presence: true
  validates :activation_number, presence: true

  enum status: { available: 0, issued: 1 }
end

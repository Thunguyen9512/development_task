# == Schema Information
#
# Table name: merchants
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  name        :string
#  payout_rate :decimal(5, 2)    default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  country_id  :integer
#
class Merchant < ApplicationRecord
  belongs_to :country
  has_many :brands

  validates :name, uniqueness: true, presence: true
end

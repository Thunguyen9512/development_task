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
class Client < ApplicationRecord
  belongs_to :country
  has_many :applications

  validates :name, uniqueness: true, presence: true
end

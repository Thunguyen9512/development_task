# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  currency   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Country < ApplicationRecord
  has_many :clients
  has_many :merchants
  validates :name, :currency, presence: true
  validates :name, :currency, uniqueness: true
end

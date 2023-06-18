# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  amount_cents    :integer          default(0), not null
#  amount_currency :string           default("USD"), not null
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :integer
#
class Product < ApplicationRecord
  belongs_to :brand
  has_many :cards

  monetize :amount_cents

  scope :active, -> { where(active: true) }

  validates :name, presence: true
  validates :amount_cents, presence: true
end

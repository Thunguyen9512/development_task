# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  description :text
#  name        :string
#  redemption  :integer          default("instore")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :integer
#
class Brand < ApplicationRecord
  belongs_to :merchant
  has_many :products

  enum redemption: { instore: 0, online: 1 }
  validates :name, uniqueness: true, presence: true

  def active_products
    products.active
  end
end

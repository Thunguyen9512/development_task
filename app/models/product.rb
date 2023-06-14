# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  amount     :decimal(10, 2)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :integer
#
class Product < ApplicationRecord
end

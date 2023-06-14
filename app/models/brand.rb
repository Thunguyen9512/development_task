# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  description :text
#  name        :string
#  redemption  :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :integer
#
class Brand < ApplicationRecord
end

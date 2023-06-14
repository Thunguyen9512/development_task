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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

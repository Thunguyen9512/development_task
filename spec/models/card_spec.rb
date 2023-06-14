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
require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

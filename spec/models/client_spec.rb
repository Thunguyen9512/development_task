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
require 'rails_helper'

RSpec.describe Client, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

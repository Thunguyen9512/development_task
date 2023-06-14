# == Schema Information
#
# Table name: applications
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string
#  secret     :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer
#
require 'rails_helper'

RSpec.describe Application, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

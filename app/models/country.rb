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
end

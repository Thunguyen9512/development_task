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
FactoryBot.define do
  factory :product do
    
  end
end

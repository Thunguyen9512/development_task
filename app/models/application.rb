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
class Application < ApplicationRecord
  belongs_to :client
  has_many :transactions

  validates :uid, presence: true, uniqueness: true
  validates :secret, presence: true
  validates :name, presence: true, uniqueness: true
end

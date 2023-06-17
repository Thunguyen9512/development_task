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
  describe 'associations' do
    it { should belong_to(:client) }
    it { should have_many(:transactions) } 
  end

  describe 'validations' do
    let(:application) { create(:application) }
    it 'is invalid without uid' do
      application.uid = nil
      expect(application).to_not be_valid
    end
    it 'is invalid without secret' do
      application.secret = nil
      expect(application).to_not be_valid
    end
    it 'is invalid with same uid' do
      new_app = build(:application, uid: application.uid)
      expect(new_app).to_not be_valid
    end
    it 'is valid with valid attributes' do
      app = build(:application, uid: Faker::Alphanumeric.alphanumeric(number: 10),
                                secret: Faker::Internet.password)
      expect(app).to be_valid
    end
  end
end

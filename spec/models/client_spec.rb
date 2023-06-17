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
  describe 'assocications' do
    it { should belong_to(:country) }
    it { should have_many(:applications) }
  end

  describe 'validations' do
    let!(:country) { create(:country) }
    let(:client) { create(:client) }
    it 'is invalid without name' do
      client.name = nil
      expect(client).to_not be_valid
    end
    it 'is invalid with same name' do
      new_client = build(:client, name: client.name)
      expect(new_client).to_not be_valid
    end
    it 'is valid with valid attributes' do
      client = build(:client, name: Faker::Name.name,
                              payout_rate: Faker::Number.between(from: 90, to: 100),
                              country: country)
      expect(client).to be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe CardService, type: :model do
  describe '#issued card' do
    let(:card) { create(:card, status: 'available') }
    let(:reference_number) { Faker::Alphanumeric.alphanumeric(number: 10) }
    let(:application) { create(:application) }
    let(:email) { Faker::Internet.email }

    it 'should raise error when no reference number' do
      service = CardService.new(card, nil, application.id, email)
      service.issued_card
      expect(service.errors).to be_present
    end
    it 'should raise error when same reference number' do
      transaction = create(:transaction, reference_number:Faker::Alphanumeric.alphanumeric(number: 10))
      service = CardService.new(card, transaction.reference_number, application.id, email)
      service.issued_card
      expect(service.errors).to be_present
    end
    it 'should raise error when no available card' do
      issued_card = create(:card, status: 'issued')
      service = CardService.new(issued_card, reference_number, application.id, email)
      service.issued_card
      expect(service.errors).to be_present
    end
    it 'should issued card with valid params' do
      service = CardService.new(card, reference_number, application.id, email)
      service.issued_card
      expect(service.errors).not_to be_present
      expect(card.status).to eq 'issued'
      expect(card.card_transaction).to be_present
    end
  end
end
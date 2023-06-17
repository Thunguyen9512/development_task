class CardService < BaseService
  attr_reader :card, :reference_number, :application_id

  def initialize(card_id, reference_number, application_id)
    @card = Card.find_by(id: card_id)
    @reference_number = reference_number
    @application_id = application_id
  end

  def issued_card
    return errors.add(:card, 'Unavailable') if card.issued?

    card_transaction = Transaction.new(
      reference_number: reference_number,
      card_id: card.id,
      application_id: application_id,
      client_amount: card.client_amount,
      merchant_amount: card.merchant_amount
    )

    if card_transaction.save
      card.update(status: 'issued')
    else
      errors.add(:card, card_transaction.errors.messages)
    end
  end
end
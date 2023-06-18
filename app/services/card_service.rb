class CardService < BaseService
  attr_reader :card, :reference_number, :application_id, :email

  def initialize(card, reference_number, application_id, email = nil)
    @card = card
    @reference_number = reference_number
    @application_id = application_id
    @email = email
  end

  def issued_card
    return errors.add(:card, 'No available card') unless card&.available?

    ActiveRecord::Base.transaction do
      card_transaction = Transaction.new(
        reference_number: reference_number,
        card_id: card.id,
        application_id: application_id,
        client_amount: card.client_amount(application_id),
        merchant_amount: card.merchant_amount
      )

      if card_transaction.save
        card.update(status: 'issued')
        send_email
      else
        errors.add(:card, card_transaction.errors.messages)
      end
    end
  end

  def send_email
    return unless email

    EmailDeliveryAfterIssuedJob.perform_later(email, card.id)
  end
end
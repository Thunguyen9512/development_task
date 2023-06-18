class EmailDeliveryAfterIssuedJob < ApplicationJob
  queue_as :mailer

  def perform(email, card_id)
    puts 'Send email to user'
  end
end

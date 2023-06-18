class TransactionPresenter < BasePresenter
  def json_response
    {
      id: id,
      client_amount: Money.new(client_amount).format,
      merchant_amount: Money.new(client_amount).format,
      reference_number: reference_number,
      created_at: created_at,
      updated_at: updated_at,
      application_id: application_id
    }
  end
end
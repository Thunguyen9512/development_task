class TransactionPresenter < BasePresenter
  def json_response
    {
      id: id,
      client_amount: client_amount,
      merchant_amount: merchant_amount,
      reference_number: reference_number,
      created_at: created_at,
      updated_at: updated_at,
      application_id: application_id
    }
  end
end
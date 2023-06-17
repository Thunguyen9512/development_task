class CardPresenter < BasePresenter
  def json_response
    {
      id: id,
      status: status,
      amount: amount,
      updated_at: updated_at,
      brand_id: brand_id,
      product_id: product_id,
      activation_number: activation_number
    }
  end

  def json_response_with_transaction
  end
end
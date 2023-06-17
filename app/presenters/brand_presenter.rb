class BrandPresenter < BasePresenter
  def json_response
    {
      id: id,
      name: name,
      description: description,
      active: active,
      redemption: redemption,
      created_at: created_at,
      updated_at: updated_at,
      merchant_id: merchant_id
    }
  end

  def json_response_with_product
    json_response.merge(active_products: active_products.map { |product| ProductPresenter.new(product).json_response })
  end
end
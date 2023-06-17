class ProductPresenter < BasePresenter
  def json_response
    {
      id: id,
      name: name,
      active: active,
      created_at: created_at,
      updated_at: updated_at,
      brand_id: brand_id,
      amount: amount
    }
  end

  def json_response_with_brand
    json_response.merge(brand: BrandPresenter.new(brand).json_response)
  end
end
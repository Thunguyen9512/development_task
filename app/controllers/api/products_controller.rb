class Api::ProductsController < ApplicationController
  include Pagy::Backend
  include Paginable
  def index
    pagy, products = pagy(Product.where(filter_params), items: per_page, page: page)
    render json: { data: products.map { |product| ProductPresenter.new(product).json_response_with_brand },
                   pagy: pagy_data(pagy) }
  end

  def show
    product = Product.find_by(id: params[:id])
    return render_errors_json({ product: 'Not Found' }, 404) unless product

    render json: { data: ProductPresenter.new(product).json_response_with_brand }
  end

  private

  def filter_params
    params.permit(:name, :brand_id, :active)
  end
end




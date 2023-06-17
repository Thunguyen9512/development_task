class Api::BrandsController < ApplicationController
  include Pagy::Backend
  include Paginable
  def index
    pagy, brands = pagy(Brand.where(filter_params), items: per_page, page: page)
    render json: { data: brands,
                   pagy: pagy_data(pagy) }
  end

  def show
    brand = Brand.find_by(id: params[:id])
    return render_errors_json({ brand: 'Not Found' }, 404) unless brand

    render json: { data: BrandPresenter.new(brand).json_response_with_product }
  end

  private

  def filter_params
    params.permit(:name, :country_id)
  end
end

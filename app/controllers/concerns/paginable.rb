module Paginable
  PER_PAGE = 20
  PAGE = 1
  def page
    @page ||= (params[:page].presence || PAGE).to_i
  end

  def per_page
    @per_page ||= (params[:per_page].presence || PER_PAGE).to_i
  end

  def pagy_data(pagy)
    {
      page: pagy.page,
      items: pagy.items,
      total: pagy.count
    }
  end
end

class Api::CardsController < ApplicationController
  def show
    card = Card.issued.find_by(id: params[:id])
    return render_errors_json({ card: 'Not Found' }, 404) unless card

    render json: { data: CardPresenter.new(card).json_response }
  end

  def issued
    product = Product.find_by(id: issued_params[:product_id])
    return render_errors_json({ product: 'No product' }, 404) unless product

    available_card = product.cards.available.first
    service = CardService.new(available_card,
                              issued_params[:reference_number],
                              current_application.id,
                              params[:email])
    service.issued_card
    return render_errors_json(service.errors, 404) if service.errors.present?

    render json: { data: CardPresenter.new(service.card).json_response_with_transaction }
  end

  private

  def issued_params
    params.permit(:reference_number, :product_id)
  end
end

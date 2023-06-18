class Api::CardsController < ApplicationController
  def show
    card = Card.issued.find_by(id: params[:id])
    return render_errors_json({ card: 'Not Found' }, 404) unless card

    render json: { data: CardPresenter.new(card).json_response }
  end

  def issued
    available_card = Card.available
                         .where(product_id: issued_params[:product_id])
                         .first
    return render_errors_json({ card: 'No vailable card' }, 404) unless available_card

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

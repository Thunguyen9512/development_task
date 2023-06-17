class Api::CardsController < ApplicationController
  def show
    card = Card.issued.find_by(id: params[:id])
    return render_errors_json({ card: 'Not Found' }, 404) unless card

    render json: { data: CardPresenter.new(card).json_response }
  end

  def issued
    card = Card.find_by(issued_params)

    return render_errors_json({ card: 'Not Found' }, 404) unless card

    if card.issued?
      render json: { data: CardPresenter.new(issued_card).json_response_with_transaction } if issued_card.present?
    else
      service = card.issued_card
      return render_errors_json({ errors: service.errors.message }, 404) if service.errors.present? 

      render_ok_status
    end
  end

  private

  def issued_params
    params.permit(:reference_number, :product_id)
  end
end

class Api::CardsController < ApplicationController
  def show
    card = Card.issued.find_by(id: params[:id])
    return render_errors_json({ card: 'Not Found' }, 404) unless card

    render json: { data: card }
  end
end

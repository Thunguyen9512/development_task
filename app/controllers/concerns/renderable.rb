module Renderable
  def render_errors_json(errors, status = 422)
    render json: { errors: errors }, status: status
  end

  def render_not_authorize
    render json: { errors: { message: 'Not Authorize' } }, status: :unauthorized
  end

  def render_fobbident
    render json: { message: "Not Authorize" }, status: 403
  end

  def render_ok_status
    render json: :ok, status: 200
  end
end

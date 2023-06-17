module Renderable
  def render_errors_json(errors, status = 422)
    render json: { errors: errors }, status: status
  end

  def render_not_authorize
    render json: { errors: { message: 'Not Authorize' } }, status: :unauthorized
  end

  def render_404_not_found_json(message = { message: "Not Found" })
    render json: message, status: 404
  end

  def render_fobbident
    render json: { message: "Not Authorize" }, status: 403
  end

  def render_token_expired
    render json: { message: "Access Token was expired!" }, status: 401
  end

  def render_invalid_token
    render json: { errors: { message: "The token was invalid, please access with a valid token! or contact us to resolve this problem." } }, status: 422
  end

  def render_invalid_plugin_version
    render json: { errors: { message: "The version of plugin is out of date, please update plugin" } }, status: 426
  end

  def render_inactive_app_key
    render json: { errors: { message: "The App key is in active , please contact Clever to support." } }, status: 426
  end

  def render_ok_status
    render json: :ok, status: 200
  end
end

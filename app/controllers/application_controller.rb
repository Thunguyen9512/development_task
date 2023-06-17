class ApplicationController < ActionController::API
  include ::Renderable
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :authenticate

  # private

  def authenticate
    current_application
  end

  def current_application
    @current_application = \
      authenticate_or_request_with_http_basic do |username, password|
        Application.find_by(uid: username, secret: password)
      end
  end
end

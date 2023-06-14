class ApplicationController < ActionController::API
  def index
    render json: { test: "test json" }
  end
end

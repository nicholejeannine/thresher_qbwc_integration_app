class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :auth

  def auth
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || ""
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
end
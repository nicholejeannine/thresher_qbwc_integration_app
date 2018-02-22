class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :auth

  def auth
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || ""
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
end
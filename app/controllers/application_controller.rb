class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_auth
  before_action :current_user

  def check_auth
    unless current_user
      flash[:warning] = "You must be logged in to access that page."
      redirect_to login_path
    end
  end

  def check_no_auth
    redirect_to start_page_path if current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def check_ownership
    model_name = params[:controller].singularize
    model_inst = instance_variable_get("@#{model_name}")
    owner = model_inst.user
    if owner.nil? || owner.id != current_user.id
      flash[:danger] = "You cannot change that which does not belong to you."
      redirect_to root_path
    end
  end
end
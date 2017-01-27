class SessionsController < ApplicationController
  layout 'public'
  before_action :check_no_auth, except: [:destroy]
  before_action :check_auth, only: :destroy

  def new
    @title = "Portal"
  end

  def create
    user = User.authenticate(params[:user][:username], params[:user][:password])
    if(user)
      session[:user_id] = user.id
      session[:username] = user.username
      flash[:success] = "Welcome.  You are logged in."
      redirect_to start_page_path
    else
      flash[:danger] = "Invalid username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:info] = "You are logged out."
    redirect_to login_path
  end
end

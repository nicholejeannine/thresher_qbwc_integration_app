class UsersController < ApplicationController

  def start_page
    @name = @current_user.username
  end
end

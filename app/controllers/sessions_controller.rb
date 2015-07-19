class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome Back!"
    else
      redirect_to root_path, flash: {error: "Invalid login"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

end

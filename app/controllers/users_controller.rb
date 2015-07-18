class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user, notice: "Account has been succesfully created!"
    else
      redirect_to new_user_path, flash: {error: "Signup failed"}
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      redirect_to user, notice: "Your profile is updated"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path(user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password)
  end
end

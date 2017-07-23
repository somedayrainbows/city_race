class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have logged in successfully."
    elsif user_params[:password] != user_params[:password_confirmation]
      redirect_to signup_path, notice: "Password confirmation doesn't match password."
    else
      redirect_to signup_path, notice: "Sorry, but that email has already been taken."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Your account has been created!"
      redirect_to root_url
    else
      flash[:alert] = "Signup failed. Please try again."
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :host)
  end
end

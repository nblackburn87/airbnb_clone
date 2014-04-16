class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
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

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      flash[:notice] = "Your account has been updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was an issue updating your account. Please try again."
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = "Your account has been deactivated."
    redirect_to root_url
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :host)
  end
end

class UsersController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  def index
  end

  def show
    @user = User.find params[:id]
  end

end

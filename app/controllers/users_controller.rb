class UsersController < ApplicationController
  def new
    @user = User.new
  end

  #set user based on URL param
  def show
    @user = User.find(params[:id])
  end

  #sign up a new user and log in if possible
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    #filter proper user params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

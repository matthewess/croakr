class UsersController < ApplicationController
  before_action :confirm_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :confirm_matching, only: [:edit, :update]
  before_action :confirm_admin, only: :destroy

  #set all users
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  #spot for new user
  def new
    @user = User.new
  end

  #set user based on URL param
  def show
    @user = User.find(params[:id])
    @croaks = @user.croaks.paginate(page: params[:page], per_page: 20)
  end

  #sign up a new user and log in if possible
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to croakr!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  #update current user attributes
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #delete a user
  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "user deleted."
    redirect_to users_path
  end

  private
    #filter proper user params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #confirm user is logged in
    def confirm_logged_in
      unless logged_in?
        store_location
        flash[:danger] = "please log in first."
        redirect_to login_path
      end
    end

    #confirm user is matching user for action
    def confirm_matching
      @user = User.find(params[:id])
      redirect_to root_path unless current_user? @user
    end

    #confirm user is an admin
    def confirm_admin
      redirect_to root_path unless current_user.admin?
    end
end

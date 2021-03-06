class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  #confirm user is logged in
  def confirm_logged_in
    unless logged_in?
      store_location
      flash[:danger] = "please log in first."
      redirect_to login_path
    end
  end
end

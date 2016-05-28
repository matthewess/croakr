class SessionsController < ApplicationController
  def new
  end

  #create a new session if valid
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = "invalid login."
      render 'new'
    end
  end

  #destroy current session and log out current user, redirecting to root
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

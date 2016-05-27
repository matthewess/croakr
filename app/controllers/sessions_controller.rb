class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      signin user
      redirect_to user
    else
      flash.now[:danger] = "invalid login."
      render 'new'
    end
  end

  def destroy
  end
end

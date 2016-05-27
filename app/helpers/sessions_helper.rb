module SessionsHelper
  #sets session cookie (expires on browser close)
  def signin(user)
    session[:user_id] = user.id
  end

  #grab the current user first time and then return from memory
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #test whether a user is logged in
  def signed_in?
    !current_user.nil?
  end
end

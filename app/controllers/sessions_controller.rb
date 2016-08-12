class SessionsController < ApplicationController

  def new
  end

  # Creates a new session when a user logs in
  def create
    # Signs a user in only if their credentials are good and they are authenticated
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      # redirects to the page user was trying to reach, else defaults to user page
      redirect_back_or @user # find in sessions_helper
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
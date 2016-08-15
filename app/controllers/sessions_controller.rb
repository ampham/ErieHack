class SessionsController < ApplicationController

  def new
  end

  # Creates a new session when a user logs in
  def create
    # Signs a user in only if their credentials are good and they authenticate
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # If the user has been activated, everything works
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      # If the user has signed up, but is not activated, they are told to check
      # for the confirmation email and get activated
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
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
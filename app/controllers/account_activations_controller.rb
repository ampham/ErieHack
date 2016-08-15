class AccountActivationsController < ApplicationController

	# Activates a new user to the website. Upon activation, user will be logged 
	# in, activated status set to true and the time stamp will be recorded
  def edit
    user = User.find_by(email: params[:email])
    # Prevents a user already activated from being activated again
    # Uses the nice authenticated? method in the User model 
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      # Updates the user in the database; see the activate method in the model
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
    	# Flash and redirect to home if the link is not valid
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
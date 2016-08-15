class UsersController < ApplicationController

  # before filter ensures only logged in users can edit, update, view the index,
  # or delete a user (must also be admin for that). Implements logged_in_user 
  # from the private methods
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # user's info can only be edited & updated by that user
  # implements correct_user from the private methods
  before_action :correct_user,   only: [:edit, :update]
  # destroy can only be used by admins. admin_user is in private methods
  before_action :admin_user,     only: :destroy


  # Show all users
  def index
    # Now we're using pagination. will_paginate will return users from the 
    # database in chunks and display them on a page with links to other pages
    @users = User.paginate(page: params[:page])
  end

  # Show a user's 'profile page'
  def show
    @user = User.find(params[:id])
  end

  # Form/View for a new user
  def new
    @user = User.new
  end

  # Action for adding a new user to the database
  # Note that we also send an activation email upon creation
  def create
    @user = User.new(user_params)
    if @user.save
      # The method for sending activation email has been moved to the model
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  # Form/View for updating user info
  def edit
    @user = User.find(params[:id])
  end

  # Action for updating user info
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Deletes a user from the database
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms a logged in user. You must me logged in to do certain actions
    def logged_in_user
      unless logged_in?
        # remembers the url clicked to send user there after logging in
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user for an action. You must be the user updating 
    # your own info 
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user. Only an admin can destroy other users (see before filter)
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end












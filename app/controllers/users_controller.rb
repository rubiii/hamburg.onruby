class UsersController < ApplicationController

  # Show all users.
  def index
    @users = User.find :all
  end

  # Register a new user account.
  def new
    @user = User.new
  end

  # Save a new user account.
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = t :registered, :scope => :flash
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  # Edit the currently logged in user.
  def edit
    @user = current_user
  end

  # Update the profile of the currently logged in user.
  def update
    @user = current_user
    if @user.update_attributes params[:user]
      flash[:notice] = t :saved_user, :scope => :flash
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

end

class UserSessionsController < ApplicationController

  # Create a new user session.
  def new
    @user_session = UserSession.new
  end

  # Login a user.
  def create
    @user_session = UserSession.new params[:user_session]
    if @user_session.save
      flash[:notice] = t "flash.logged_in"
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  # Logout the current user.
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t :logged_out, :scope => :flash
    redirect_to root_url
  end

end

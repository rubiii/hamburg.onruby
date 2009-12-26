class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery

  filter_parameter_logging :password

  helper_method :current_user, :current_user?

private

  # Returns the logged in user session.
  def current_user_session
    @current_user_session ||= UserSession.find
  end

  # Returns the logged in user.
  def current_user
    @current_user ||= current_user_session && current_user_session.record
  end

  # Returns whether a given +user+ matches the logged in user.
  def current_user?(user)
    user == current_user
  end

end

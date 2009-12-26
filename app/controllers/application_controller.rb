class ApplicationController < ActionController::Base

  protect_from_forgery
  filter_parameter_logging :password

  helper :all
  helper_method :current_user, :current_user?

  before_filter :subdomain, :validate_subdomain

private

  # Sets the subdomain.
  def subdomain
    @subdomain = request.subdomains.first
  end

  # Redirects requests without subdomain to hamburg.onruby.
  def validate_subdomain
    redirect_to "http://hamburg.#{request.domain}#{request.port_string}" and
      return unless @subdomain == "hamburg"
  end

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

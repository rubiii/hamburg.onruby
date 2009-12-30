module ApplicationHelper

  # Returns an Array of account-related links for the current user.
  # These are typical register, login, logout and edit links.
  def account_links
    if current_user
      [ { :name => current_user.username, :link => edit_user_path(:current) },
        { :name => t("labels.logout"),    :link => logout_path } ]
    else
      [ { :name => t("labels.register"),  :link => register_path },
        { :name => t("labels.login"),     :link => login_path } ]
    end
  end

  def show_flash
    msg = flash[:error] || flash[:notice]
    msg ? content_tag(:div, msg) : ""
  end

  # Sets up an initial empty project for a user.
  def setup_user(user)
    returning(user) { |u| u.projects.build if u.projects.empty? }
  end

end

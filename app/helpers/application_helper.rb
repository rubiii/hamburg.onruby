module ApplicationHelper

  # Returns an Array of account-related links for the current user.
  # These are typical register, login, logout and edit links.
  def account_links
    if current_user
      [ link_to(current_user.username, edit_user_path(:current)),
        link_to("Logout", logout_path) ]
    else
      [ link_to("Register", register_path),
        link_to("Login", login_path) ]
    end
  end

end

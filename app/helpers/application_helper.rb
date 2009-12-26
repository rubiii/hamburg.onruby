module ApplicationHelper

  # Returns an Array of account-related links for the current user.
  # These are typical register, login, logout and edit links.
  def account_links
    if current_user
      [ link_to(current_user.username, edit_user_path(:current)),
        link_to("Abmelden", logout_path) ]
    else
      [ link_to("Registrieren", register_path),
        link_to("Anmelden", login_path) ]
    end
  end

  def setup_user(user)
    returning(user) { |u| u.projects.build if u.projects.empty? }
  end

end


require 'site_prism'

class LoginPage < SitePrism::Page

  # Mapping all elements in Login Page.
  element :field_email, "#user_email"
  element :field_pass, "#user_password"
  element :bt_submit, "input[type=submit]"
  element :logout_menu, ".btn.btn-sm.btn-default.logout-link"
  element :main_menu_user, "span.navbar-account-name"

end

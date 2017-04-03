Given(/^I am on RD Station login page "([^"]*)"\.$/) do |site|
  @register = RegisterPage.new
  @login = LoginPage.new
  @Help = HelpRegisterPage.new
  visit(site)
end

When(/^testable outcome Fill in the email field "([^"]*)"\.$/) do |login_type|
    $index = login_type == "Pessoa Fisica" ? 0 : 1
    expect(@Help.set_email(@login.field_email)).to eql($emails[$index])
end

When(/^Fill in the field password\.$/) do
    expect(@Help.set_pass(@login.field_pass)).to eql($pass[$index])
end

When(/^Select Ok button\.$/) do
    @register.bt_submit.click()
end

Then(/^Validate user access\.$/) do
  message = $company[$index]
  expect(@login.main_menu_user.text.downcase).to  eql(message.downcase)
end

When(/^To do the logout\.$/) do
  @login.main_menu_user.click()
  @login.logout_menu.click()
end

Then(/^Validate the logout successfully performed\.$/) do
  expect(@login).to have_selector('span.navbar-account-name', visible: false)
end
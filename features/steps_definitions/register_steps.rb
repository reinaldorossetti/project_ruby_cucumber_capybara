Given(/^I am on RD Station registration page "([^"]*)"\.$/) do |site|
  @register = RegisterPage.new
  @login = LoginPage.new
  @Help = HelpRegisterPage.new
  visit(site)
end

When(/^Fill in the information of the Account and Login "([^"]*)"\.$/) do |login_type|
    
    $index = login_type == "Pessoa Fisica" ? 0 : 1
    expect(@Help.set_email(@register.email)).to eql($emails[$index])
    expect(@Help.set_pass(@register.password)).to eql($pass[$index])
    expect(@Help.set_pass_confirmation(@register.password_confirmation)).to eql($pass[$index])
    expect(@Help.set_company(@register.user_company)).to eql($company[$index])
    expect(@Help.set_site(@register.site)).to eql($sites[$index])
end

When(/^Fill in the information of the Contracting Authority\.$/) do
    expect(@Help.set_country(@register)).to eql($nations[$index])
    expect(@Help.set_state(@register.state)).to eql($states[$index])
    expect(@Help.set_city(@register.city)).to eql($cities[$index])
    expect(@Help.set_cep(@register.zipcode)).to eql($zipcodes[$index])
    expect(@Help.set_address(@register.address)).to eql($address[$index].sub("\r", ""))
    expect(@Help.set_contractor_type(@register)).to eql($contractor_type[$index])
    puts $contractor_type[$index]

    if $contractor_type[$index] == "PJ"
        expect(@Help.set_cnpj(@register.identifier_cnpj)).to eql($cnpj[$index])
        expect(@Help.set_simples_nacional(@register)).to eql($simples_nacional[$index]) 
        expect(@Help.set_razao(@register.official_name)).to eql($razao[$index])
    end      
    if $contractor_type[$index] == "PF"
        expect(@Help.set_name(@register.contractor_name)).to eql($full_name[$index])
        expect(@Help.set_cpf(@register.identifier_cpf)).to eql($cpf[$index])
        expect(@Help.set_job_name(@register.job_title)).to eql($job_title[$index])
    end
end

When(/^Send the completed register\.$/) do
  @register.bt_submit.click()
end

Then(/^Validate user access with message "([^"]*)"\.$/) do |message|
  expect(@register.main_menu_user.text.downcase).to  eql(message.downcase)
end
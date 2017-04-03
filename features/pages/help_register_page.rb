require 'site_prism'
require 'selenium-webdriver'

class HelpRegisterPage < SitePrism::Page

  # functions to help register steps.
  element :email, "#user_email"
  
  def set_email(register)
      user_email = $emails[$index]
      register.email.set user_email
      return register.email.value
  end
  def set_pass(register)
      user_pass = $pass[$index]
      register.password.set user_pass
      register.password_confirmation.set user_pass
      return register.password.value
  end
  def set_company(register)
      company = $company[$index]
      register.user_company.set company
      return register.user_company.value
  end
  def set_site(register)
      sites = $sites[$index]
      register.site.set sites
      return register.site.value
  end
  def set_country(register)
      nation = $country_abbreviations[$index]
      country_text = register.all("option[value='#{nation}']")[1].select_option
      return country_text.text
  end
  def set_state(register)
      state = $states[$index]
      state_text = register.state.select(state)
      return state_text.text
  end
  def set_city(register)
      city = $cities[$index]
      city_text = register.city.select(city)
      return city_text.text
  end
  def set_cep(register)
      zipcode = $zipcodes[$index]
      register.zipcode.set zipcode
      return register.zipcode.value
  end
  def set_address(register)
      address = $address[$index]
      register.address.set address
      return register.address.value
  end
  def set_contractor_type(register)
      # Melhorar depois
      type_text = $contractor_type[$index]
      contractor_type = register.find("#info_contractor_type option[value='#{type_text}']").select_option
      return contractor_type.value
  end
  def set_simples_nacional(register)
      # Melhorar depois
      simples_nacional = $simples_nacional[$index]
      simples_nacional_value = register.find("#info_contractor_simples_nacional option[value='#{simples_nacional}']").select_option
      return simples_nacional_value.value
  end
  def set_cnpj(register)
      cnpj_text = $cnpj[$index]
      register.identifier_cnpj.set cnpj_text
      return register.identifier_cnpj.value
  end
  def set_cpf(register)
      cpf = $cpf[$index]
      register.identifier_cpf.set cpf
      return register.identifier_cpf.value
  end
  def set_razao(register)
      razao = $razao[$index]
      register.official_name.set razao
      return register.official_name.value
  end
  def set_name(register)
      name = $full_name[$index]
      register.contractor_name.set name
      return register.contractor_name.value
  end
  def set_job_name(register)
      job_title = $job_title[$index]
      register.job_title.set job_title
      return register.job_title.value
  end
end
require 'site_prism'
require 'selenium-webdriver'

class HelpRegisterPage < SitePrism::Page

  # functions to help register steps.

  def set_email(register)
      user_email = $emails[$index]
      register.set user_email
      return register.value
  end
  def set_pass(register)
      user_pass = $pass[$index]
      register.set user_pass
      return register.value
  end
  def set_pass_confirmation(register)
      user_pass = $pass[$index]
      register.set user_pass
      return register.value
  end
  def set_company(register)
      company = $company[$index]
      register.set company
      return register.value
  end
  def set_site(register)
      sites = $sites[$index]
      register.set sites
      return register.value
  end
  def set_country(register)
      country_text = register.all("option[value='#{$country_abbreviations[$index]}']")[1].select_option
      return country_text.text
  end
  def set_state(register)
      state = $states[$index]
      state_text = register.select(state)
      return state_text.text
  end
  def set_city(register)
      city = $cities[$index]
      city_text = register.select(city)
      return city_text.text
  end
  def set_cep(register)
      zipcode = $zipcodes[$index]
      register.set zipcode
      return register.value
  end
  def set_address(register)
      address = $address[$index]
      register.set address
      return register.value
  end
  def set_contractor_type(register)
      seletor = "#info_contractor_type option[value='#{$contractor_type[$index]}']"
      contractor_type = register.find(seletor).select_option
      return contractor_type.value
  end
  def set_simples_nacional(register)
      selector = "#info_contractor_simples_nacional option[value='#{$simples_nacional[$index]}']"
      simples_nacional_value = register.find(selector).select_option
      return simples_nacional_value.value
  end
  def set_cnpj(register)
      cnpj_text = $cnpj[$index]
      register.set cnpj_text
      return register.value
  end
  def set_cpf(register)
      cpf = $cpf[$index]
      register.set cpf
      return register.value
  end
  def set_razao(register)
      razao = $razao[$index]
      register.set razao
      return register.value
  end
  def set_name(register)
      name = $full_name[$index]
      register.set name
      return register.value
  end
  def set_job_name(register)
      job_title = $job_title[$index]
      register.set job_title
      return register.value
  end
end
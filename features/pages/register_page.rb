require 'site_prism'
# global variables.
$emails = []
$pass = []
$company = []
$sites = []
$nations = []
$country_abbreviations = []
$states = []
$cities = []
$zipcodes = []
$address = [] 
$contractor_type = []
$simples_nacional = []
$cnpj = []
$razao = []
$cpf = []
$full_name = []
$job_title = []
$index = 0

class RegisterPage < SitePrism::Page

  # Mapping all elements in Register Page.

  element :email, "#user_email"
  element :password, "#user_password"
  element :password_confirmation, "#user_password_confirmation"
  element :user_company,"#user_account_name"
  element :site,  "#user_account_site"
  element :country,  "#user_account_subscription_attributes_info_country"
  element :state,  "select[id='user_account_subscription_attributes_info_state']"
  element :city,  "select[id='user_account_subscription_attributes_info_city']"
  element :zipcode,  "#info_zipcode"
  element :address, "#user_account_subscription_attributes_info_address"
  element :info_contractor,  "#info_contractor_type"
  element :simples_nacional,  "#info_contractor_simples_nacional"
  element :identifier_cnpj,  "#info_identifier_cnpj"
  element :official_name,  "#info_official_name"
  element :contractor_name,  "#user_account_subscription_attributes_contractor_attributes_name"
  element :identifier_cpf,  "#info_identifier_cpf"
  element :job_title,  "#info_job_title"
  element :bt_submit, "input[type=submit]"
  element :menu_welcome, "#dedicated_flow .help-block"

  @data = MySQL.new
  result = @data.query_test('SELECT * FROM conta')
  result_contratante = @data.query_test('SELECT * FROM contratante')

  result.each do |conta|
    $emails.push(conta['email'])
    $pass.push(conta['password'])
    $company.push(conta['empresa'])
    $sites.push(conta['site'])
  end

  result_contratante.each do |contratante|
    puts contratante
    $nations.push(contratante['pais'])
    $country_abbreviations.push(contratante['pais_sigla'])
    $states.push(contratante['estado'])
    $cities.push(contratante['cidade'])
    $zipcodes.push(contratante['cep'])
    $address.push(contratante['endereco'])
    $contractor_type.push(contratante['tipo_entidade'])
    $simples_nacional.push(contratante['optante'])
    $cnpj.push(contratante['cnpj'])
    $razao.push(contratante['razao']) 
    $cpf.push(contratante['cpf'])
    $full_name.push(contratante['full_name'])
    $job_title.push(contratante['cargo'])
  end
end

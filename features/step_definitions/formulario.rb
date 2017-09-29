#encoding: utf-8
form = FormSelectors.new(@driver)
page = TestSuite.new(@driver)
main_result = SelectorsFormResponse.new(@driver)

Dado(/^que acesse a tela de formulario$/) do
  expect(page.title).to eq("Watir-WebDriver Demo")
end

Dado(/^preencher os campos do formulario\.$/) do |table|
  data = table.rows_hash
  page.test_form_fill(form, data['texto'], data['language'], data['question'], data['versions'])
end

Dado(/^Selecionar a opcao "([^"]*)"$/) do |arg1|
  if arg1 == "Enviar"
    page.submit(form)
  end
end

Então(/^Deve informar uma mensagem de sucesso "([^"]*)"\.$/) do |arg1|
  resultado =  page.result(main_result)
  puts resultado
  expect(resultado) == ("Thank you for playing with Watir-WebDriver")
  page.close
end
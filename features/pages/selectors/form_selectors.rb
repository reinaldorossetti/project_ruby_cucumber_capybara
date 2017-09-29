
class SelectorsFormResponse
  include Tapestry

  div(:result_end, css: '.ss-resp-message')

end

class FormSelectors
  include Tapestry

  text_field(:text, id: "entry_1000000")
  select_list(:combobox, id: "entry_1000001")
  radio(:test_radio, value: 'A programming language')
  radio(:test_radio_gem, value: 'A gem')
  radio(:both, id: 'group_1000003_3')
  checkbox(:versions01, :id => "group_1000004_1")
  checkbox(:versions02, :id => "group_1000004_2")
  checkbox(:versions03, :id => "group_1000004_3")
  button(:submit, name: 'submit')

  # exemplo usando o iframe
  iframe :pesquisa_cliente, name: 'principal'
  input :something, -> { pesquisa_cliente.input(id: 'pesqMestreCodCliente') }

end
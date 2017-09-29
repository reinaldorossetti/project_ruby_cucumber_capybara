if ENV['BASE'] == false
  require '../framework/page_base' # para visualizar as funcoes dentro da classe mae PageBase.
end

class TestSuite < PageBase
  include Tapestry

  def test_form_fill(form, texto, language, ruby, versions)

    preencher(form.text, texto)
    form.combobox.select language

    case ruby
      when 'A programming language'
        clique(form.test_radio)
      when 'A gem'
        clique(form.test_radio_gem)
      else 'Both'
        clique(form.both)
    end

    case versions
      when '1.8.6'
        clique(form.versions01)
      when '1.8.7'
        clique(form.versions02)
      when '1.9.2'
        clique(form.versions03)
    end

    puts form.something.inspect
  end

  def submit(form)
    clique(form.submit)
    form.submit.wait_while_present
  end

  def title
    @driver.title
  end

  def close
    @driver.quit
  end

  def result(menu_result)
    elem = menu_result.result_end.wait_until_present
    elem.text
    #puts menu_result.result_end.wait_until_present.text.to_s
  end
end

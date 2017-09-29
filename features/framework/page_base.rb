
class PageBase
  include Tapestry

  def initialize(browser)
    @driver = browser
  end

  def preencher(element, value)

    result = element_exists?(element)
    if result
      # to_subtype - convert the input into the more specific type in text field to clear field.
      element.to_subtype.clear
      element.focus
      element.flash(color: "yellow")
      element.send_keys value
    end
  rescue Selenium::WebDriver::Error::UnexpectedAlertOpenError
    sleep 3
    retry
  end

  def clique(elem)

    # Mapeia o elemento e verifica se o elemento existe e visivel.
    element_exists?(elem)
    puts elem.inspect
    # Imprime o elemento e scroll/desce ateh o elemento.
    scroll_to_element(elem)

    # coloca o foco sobre o elemento e realiza o click.
    elem.focus
    elem.flash(color: "yellow")
    elem.click

  rescue => ex
    puts ex.message
    puts ex.backtrace
    print "Tentando via javascript"

  end

  def element_exists?(web_element)
    # na nova versao a espera fica assim .wait_until(&:present?)
    # puts Watir.default_timeout
    if web_element.wait_until(&:present?)
      true
    end

  rescue => ex
    puts ex.message
    puts ex.backtrace
    print "Tela #{@driver.title} - Elemento '#{web_element.inspect}' não encontrado."
    false

  end

  def scroll_to_element(elem)

    @driver.execute_script('arguments[0].scrollIntoView();', elem)

  rescue => ex
    puts ex.message
    false
  end

end

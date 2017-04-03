require 'os'

=begin
Criar uma pasta drivers na raiz do diretorio
no windows c:\\drivers\\win + nome da plataforma 64 ou 32.
no linix /home/reiload/drivers/linux + nome da plataforma 64 ou 32.
mude o nome do usuario no linux.
>> Melhorar  a funcao depois fazer menos if e menor.
=end

class Helper

  def initialize
    @path_win = "C:\\drivers"
    @path_mac = "C:\\drivers"
    @path_linux = "/home/reiload/drivers"
  end
  def get_os(browser)

      if OS.windows? && OS.bits==64
          string_path ="#{@path_win}\\win64\\"
          return browser_win(browser, string_path)
      end

      if OS.windows? && OS.bits==32
        string_path = "#{@path_win}\\win32\\"
        return browser_win(browser, string_path)
      end

      if OS.mac? && OS.bits==64
          string_path = "#{@path_mac}\\mac64\\"
          return browser_linux(browser, string_path)
      end

      if OS.linux? && OS.bits==64
        string_path = "#{@path_linux}/linux64/"
        return browser_linux(browser, string_path)
      end

      if OS.linux? && OS.bits==32
        string_path = "#{@path_linux}/linux32/"
        return browser_linux(browser, string_path)
      end
  end

  def browser_win(browser, string_path)
    if browser == "chrome"
        return string_path + "chromedriver.exe"
    end
    if browser == "firefox"
        return string_path + "geckodriver.exe"
    end
  end
  def browser_linux(browser, string_path)
    if browser == "chrome"
        return string_path + "chromedriver"
    end
    if browser == "firefox"
        return string_path + "geckodriver"
    end
  end
end

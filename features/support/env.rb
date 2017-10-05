require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require_relative  'helper.rb'
require 'rspec/retry'

BROWSER = ENV['BROWSER']
puts(BROWSER)
# Pega o driver de acordo com o SO e plataforma.
# comente essa parte e o driver_path se o driver estive jah configurado.
helps = Helper.new
PATH = helps.get_os(BROWSER.downcase)
puts(PATH)

Capybara.register_driver :selenium do |app|
  Capybara.default_max_wait_time = 60
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app,
                                   :browser => :chrome,
                                   :driver_path => "#{PATH}",
                                   :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                                       'chromeOptions' => {
                                           'args' => [ "--start-maximized" ]
                                       }
                                   )

    )
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, :browser => :firefox,
                                     :marionette => true,
                                   :driver_path => "#{PATH}")
  elsif BROWSER.eql?('internet_explorer')
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
  elsif BROWSER.eql?('safari')
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  end
end

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

RSpec.configure do |config|
  # show retry status in spec process
  config.verbose_retry = true
  # Try twice (retry once)
  config.default_retry_count = 2
  # Only retry when Selenium raises Net::ReadTimeout
  config.exceptions_to_retry = [Net::ReadTimeout]
  Capybara.javascript_driver = :webkit
  # wait for ajax.
  config.include WaitForAjax, type: :feature
end

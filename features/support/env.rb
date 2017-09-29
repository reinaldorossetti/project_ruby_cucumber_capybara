require 'rspec/core'
include RSpec::Matchers
require 'rspec/expectations/handler'
require "tapestry"
require 'watir'

Dir["../framework/*.rb"].each {|file| require file; puts file }
Dir["../pages/selectors/*.rb"].each {|file| require file; puts file }
Dir["../pages/*.rb"].each {|file| require file ; puts file}

@driver = Watir::Browser.start 'http://bit.ly/watir-webdriver-demo', :firefox

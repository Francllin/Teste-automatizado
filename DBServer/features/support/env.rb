require 'rspec'
require 'capybara-screenshot/cucumber'
require 'capybara/cucumber'
require 'site_prism'
require 'capybara'
require 'selenium-webdriver'
require 'yaml'
require 'capybara/rspec'
require 'pry'
require 'phantomjs'
require 'capybara/poltergeist'


Capybara.register_driver :selenium_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { 'args' => ['--start-maximized'] })
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

  $browser = 'selenium'

  if 'selenium' == $browser
    ##Rodar com o browser ativo##
    Capybara.default_driver = :selenium_chrome
  elsif 'poltergeist' == $browser
    ##Rodar em modo headless browser##
    Capybara.default_driver    = :poltergeist
    Capybara.javascript_driver = :poltergeist
  end


Capybara.default_max_wait_time = 10

Capybara.current_session.driver.browser.manage.window.resize_to(1200, 800)

 # Variavel de configuração de BASE_URL de ambiente
$ambiente = 'homo' || ENV['AMBIENTE']

 # Arquivo de BASE_URL, Url de ambiente
$base_url = YAML.load_file('./features/config/environment.yml')[$ambiente]

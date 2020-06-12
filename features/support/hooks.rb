require 'selenium-webdriver'

Before do
  caps = {
    'bstack:options' => {
      "os" => "Windows",
      "osVersion" => "10",
      "local" => "false",
      "consoleLogs" => "info",
      "networkLogs" => "true",
      "seleniumVersion" => "3.5.2",
    },
    "browserName" => "IE",
    "browserVersion" => "11.0",
  }

  @driver = Selenium::WebDriver.for(:remote,
    :url => "http://" + ENV['USERNAME'] + ":" + ENV['PASSWORD'] + "@hub-cloud.browserstack.com/wd/hub",
    :desired_capabilities => caps)
  @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  puts "DRIVER MUST HAVE INITIALIZED BY NOW"
end

After do
  @driver.quit
end

require 'selenium-webdriver'
require 'test-unit'

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

  driver = Selenium::WebDriver.for(:remote,
    :url => "http://" + ENV['USERNAME'] + ":" + ENV['PASSWORD'] + "@hub-cloud.browserstack.com/wd/hub",
    :desired_capabilities => caps)
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)

Given(/^I am on "([^"]*)" homepage$/) do |website|
  driver.navigate.to "http://www.#{website}"
end

When(/^I search for "([^"]*)" in search bar and hit enter$/) do |product|
  element = driver.find_element(:name, 'q')
  element.send_keys product
  element.submit
  element = wait.until { driver.find_element(:class => "_3wU53n") }
end

Then(/^I should see relevant search results$/) do
  elements = driver.find_elements(:class, "_3wU53n")
  puts "Elements array size: #{elements.size}"
  elements.each do |e|
  	puts e.text
  end
  assert_equal elements.size,10
  driver.quit
end

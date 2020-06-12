require 'selenium-webdriver'

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
    :url => "http://prateekbhiwapurk2:5yDG4MWRdXoFx8Fzg2Mi@hub-cloud.browserstack.com/wd/hub",
    :desired_capabilities => caps)

Given(/^I am on "([^"]*)" homepage$/) do |website|
  driver.navigate.to "http://www.#{website}"
end

When(/^I search for "([^"]*)" in search bar and hit enter$/) do |product|
  element = driver.find_element(:name, 'q')
  element.send_keys product
  element.submit
  sleep 10
end

Then(/^I should see relevant search results$/) do
  elements = driver.find_elements(:xpath, "//div[@class='bhgxx2 col-12-12']//div[@class='_3wU53n']")
  puts "Elements array size: #{elements.size}"
  elements.each do |e|
  	puts "Printing element text"
  	puts e.text
  end
  driver.quit
end

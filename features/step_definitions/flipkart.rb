Given(/^I am on "([^"]*)" homepage$/) do |website|
  @driver.navigate.to "http://www.#{website}"
end

When(/^I search for "([^"]*)" in search bar and hit enter$/) do |product|
  element = @driver.find_element(:name, 'q')
  element.send_keys product
  element.submit
  element = @wait.until { @driver.find_element(:class => "_3wU53n") }
end

Then(/^I should see relevant search results$/) do
  elements = @driver.find_elements(:class, "_3wU53n")
  puts "Elements array size: #{elements.size}"
  elements.each do |e|
  	puts e.text
  end
  assert_equal 24,elements.size
end

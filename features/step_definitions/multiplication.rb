Given(/^I have variable a$/) do
  @a = 50
end

And(/^I have variable b$/) do
  @b = 70
end

When(/^I multiply a and b$/) do
  @mul = @a * @b
end

Then(/^I display the product$/) do
  puts "Multiplication of #{@a} and #{@b} is #{@mul}"
end

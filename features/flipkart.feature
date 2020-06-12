Feature: Look for search results for a product on an e-commerce website

Scenario Outline: Visit webapp and return search results
  Given I am on "flipkart.com" homepage
  When I search for <product> in search bar and hit enter
  Then I should see relevant search results

Examples:
  | product      |
  | "Moto G9" |
  | "iPhone 11"  |
  | "Samsung Galaxy s10"  |

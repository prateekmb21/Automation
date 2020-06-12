Feature: Look for search results for a product on an e-commerce website

Scenario: Visit webapp and return search results
  Given I am on "flipkart.com" homepage
  When I search for "OnePlus 7t" in search bar and hit enter
  Then I should see relevant search results

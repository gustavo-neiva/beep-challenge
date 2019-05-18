require 'watir'
require 'pry-byebug'
require 'test/unit'

include Test::Unit::Assertions

browser = Watir::Browser.new
browser.driver.manage.window.maximize

Given("I access homepage") do
  @browser.goto('http://127.0.0.1:9292/')
end

Given("my homepage has three currency check buttons") do
  assert(@browser.button(id: "usd_brl").exists?)
  assert(@browser.button(id: "usd_eur").exists?)
  assert(@browser.button(id: "usd_arg").exists?)
end

Given("there is a Highchart already showing historical usd/brl data") do
  pending
end

When("I click on the usd/brl button") do
  pending
end

Then("the chart data corresponds to the currency api json") do
  pending
end

Before do 
  @browser = browser
end
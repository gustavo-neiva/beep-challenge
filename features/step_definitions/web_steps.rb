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
  assert(@browser.link(id: "usd_brl").exists?)
  assert(@browser.link(id: "usd_eur").exists?)
  assert(@browser.link(id: "usd_arg").exists?)
end

Given("there is a Highchart already showing historical usd to brl data") do
  assert(@browser.element(class: "highcharts-background").exists?)
end

When("the app renders the graph") do
  assert(@browser.element(:css => 'g.highcharts-markers').exists?)
end

Then("the chart data corresponds to the currency api json") do
  tooltip_values = @browser.elements(css: 'g.highcharts-tooltip tspan')
  date = tooltip_values[0].text
  Date.parse(date)
  currency_name = tooltip_values[2].text
  assert(currency_name == 'BRL:')
  currency = tooltip_values[3].text
  assert((currency =~ /-?\d+(?:\.\d+)?/).zero?)
  Float(currency)
end

Before do 
  @browser = browser
end

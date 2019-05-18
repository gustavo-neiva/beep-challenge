Feature: Currency Highchart Website 
    Access currency api and retrieve data
	Scenario: As a user, I can open a chart comparing usd/euro historical data
	  Given I access homepage
      Given my homepage has three currency check buttons
      Given there is a Highchart already showing historical usd to brl data
      When I click on the usd/brl button
      Then the chart data corresponds to the currency api json
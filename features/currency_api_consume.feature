Feature: Currency Highchart Website
    As a usern I want to access the webpage and get currency data
	Scenario: Open page containing a chart comparing usd/brl historical data
	  Given I access homepage
    Given my homepage has three currency check buttons
    Given there is a Highchart already showing historical usd to brl data
    When the app renders the graph
    Then the chart data corresponds to the currency api json
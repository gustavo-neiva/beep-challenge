require_relative 'api_wrapper'

class GraphBuilder

  def initialize(currency)
    @currency = currency
  end

  def build_graph
    dates, currency = fetch_data
    LazyHighCharts::HighChart.new('graph') do |g|
      g.title(text: 'Currency quotations')
      g.series(
        type: 'spline',
        name: @currency[3..-1],
        data: currency
      )
      g.yAxis(title: {text: 'Currency Price for 1 USD'})
      g.options[:xAxis][:categories] = dates
    end
  end

  private

  def fetch_data
    raw_data = CurrencyApiWrapper.new(@currency).make_requests
    dates = raw_data[:dates]
    currency = raw_data[:currency]
    return dates, currency
  end

end
require_relative 'api_wrapper'

class GraphBuilder

  def initialize(currency)
    @currency = currency
  end

  def build_graph
    raw_data = fetch_data
    dates = raw_data[:dates]
    currency = raw_data[:currency]
    graph = LazyHighCharts::HighChart.new('graph') do |g|
      g.title(text: 'Currency quotations')
      g.series(
        type: 'spline',
        name: 'BRL',
        data: currency
      )
      g.yAxis(title: {text: 'Currency Price for 1 USD'})
      g.options[:xAxis][:categories] = dates
    end
  end

  private

  def fetch_data
    CurrencyApiWrapper.new('USDBRL').make_requests
  end

end
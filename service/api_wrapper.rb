require 'http'

class CurrencyApiWrapper
  def initialize(currency)
    @currency = currency
  end

  def make_requests()
    dates = generate_date_range
    currency = []
    dates.each { |date| currency << filter_currency(get_currency_data(date).parse) }
    data = { dates: dates, currency: currency}
  end

  def get_currency_data(date)
    # key = ENV['CURRENCY_API_KEY']
    # HTTP.get("http://www.apilayer.net/api/historical?access_key=#{key}&date=#{date}")
    HTTP.get("http://www.apilayer.net/api/historical?access_key=8fe60d94d3af8516b819338809772a35&date=#{date}")
  end

  def generate_date_range
    (Date.today - 7..Date.today).map(&:to_s)
  end

  def filter_currency(json)
    json.dig('quotes')[@currency]
  end

end
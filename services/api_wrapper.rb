require 'http'

class CurrencyApiWrapper
  def initialize(currency)
    @currency = currency
  end

  def request_currency_data
    dates = generate_date_range
    currency = filter_and_parse_data(dates)
    { dates: dates, currency: currency}
  end

  private

  def filter_and_parse_data(data_range)
    currency = []
    data_range.each { |date| currency << filter_currency(make_request(date).parse) }
    currency
  end

  def make_request(date)
    key = ENV['CURRENCY_API_KEY']
    HTTP.get("http://www.apilayer.net/api/historical?access_key=#{key}&date=#{date}")
  end

  def generate_date_range
    (Date.today - 7..Date.today).map(&:to_s)
  end

  def filter_currency(dict)
    dict.dig('quotes')[@currency]
  end

end
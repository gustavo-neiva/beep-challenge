require 'roda'
require 'daru/view'

class RodaQuotations < Roda
  plugin :static, ["/images", "/css", "/js"]
  plugin :render
  plugin :head

  route do |r|
    r.root do
      @line_graph = line_graph()
      r.params
      view("homepage")
    end
  end

  def line_graph
    @line_graph = Daru::View::Plot.new(data= make_random_series(3), adapter: :highcharts, name: 'spline1', type: 'spline', title: 'Irregular spline')
  end

  def make_random_series(step)
    data = []
    for i in 0..10
      data << [(rand * 100).to_i]
    end
    data
  end
  
end

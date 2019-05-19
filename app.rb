require 'roda'
require_relative 'service/graph_builder'
require 'dotenv'
require 'lazy_high_charts'

include LazyHighCharts::LayoutHelper

Dotenv.load

class RodaQuotations < Roda
  plugin :static, ["/images", "/css", "/js"]
  plugin :render
  plugin :head

  route do |r|
    r.root do
      @line_graph = line_graph()
      view("homepage")
    end
  end

  def line_graph
    @line_graph = GraphBuilder.new('USDBRL').build_graph
  end
  
end

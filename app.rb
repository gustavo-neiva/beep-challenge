require 'roda'
require_relative 'services/graph_builder'
require 'dotenv'
require 'lazy_high_charts'

include LazyHighCharts::LayoutHelper

Dotenv.load

class BeepChallenge < Roda
  plugin :static, ["/css", "/js"]
  plugin :render
  plugin :head

  route do |r|
    r.root do
      @line_graph = line_graph('USDBRL')
      view("homepage")
    end

    r.get "usdbrl" do
      @line_graph = line_graph('USDBRL')
      view("homepage")
    end

    r.get "usdeur" do
      @line_graph = line_graph('USDEUR')
      view("homepage")
    end

    r.get "usdars" do
      @line_graph = line_graph('USDARS')
      view("homepage")
    end
  end

  def line_graph(currency)
    @line_graph = GraphBuilder.new(currency).build_graph
  end

end
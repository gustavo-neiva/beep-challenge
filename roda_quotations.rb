require "roda"

class RodaQuotations < Roda
  plugin :static, ["/images", "/css", "/js"]
  plugin :render
  plugin :head

  route do |r|
    r.root do
      view("homepage")
    end
  end
end

require "roda"

class RodaQuotations < Roda
  route do |r|
    r.root do
      "Hello!"
    end
  end
end

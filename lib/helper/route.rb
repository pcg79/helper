module Helper
  class Route
    def initialize(pattern, handler)
      @pattern = pattern
      @handler = handler
    end

    attr_reader :pattern, :handler

    def matches?(message)
      pattern.match(message)
    end

    def build(match_data)
      handler.new(*match_data[1..-1])
    end
  end
end

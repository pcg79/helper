module Helper
  class Router
    def initialize(bot_name)
      @bot_name = bot_name
      @routes = []
    end

    def noop(message)
      Helper::Handlers::Noop.new(message)
    end

    def handler_for(message)
      return noop(message) unless message[:body].to_s.start_with?(@bot_name)

      message_body = message[:body].to_s.gsub(@bot_name, '').strip

      @routes.each do |route|
        if match_data = route.matches?(message_body)
          return route.build(match_data)
        end
      end

      noop(message)
    end

    def add_route(pattern, handler)
      @routes << Route.new(pattern, handler)
    end
  end
end

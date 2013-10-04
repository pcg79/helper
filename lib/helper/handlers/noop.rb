module Helper
  module Handlers
    class Noop
      def initialize(message)
        @message = message
      end

      def respond(*)
        puts "NOOP: #{@message}"
      end
    end
  end
end

module Helper
  module Handlers
    class Echo
      include Handler

      def self.pattern
        /^echo (.*)$/i
      end

      def initialize(*args)
        @args = args
      end

      def respond(room)
        room.speak(@args.join(' '))
      end
    end
  end
end

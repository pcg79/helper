module Helper
  class Listener
    include Celluloid

    def initialize(room, router)
      @room = room
      @router = router

      self.async.run
    end

    def run
      log("Watching #{@room.name}")

      @room.watch do |message|
        log("Recived message: #{message}")

        @router.handler_for(message).respond(@room)
      end
    end

    def log(msg)
      Celluloid.logger.info(msg)
    end
  end
end

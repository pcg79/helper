module Helper
  class RoomSupervisor
    def initialize(router, rooms)
      @supervisor = Celluloid::SupervisionGroup.new

      rooms.each do |room|
        @supervisor.add(Listener, args: [room, router])
      end
    end

    def terminate
      @supervisor.terminate
    end
  end
end

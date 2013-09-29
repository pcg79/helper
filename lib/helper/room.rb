module Helper
  class Room
    def self.rooms(connection)
      connection.req('/rooms')[:rooms]
    end

    def self.find_by_name(connection, name)
      if room = rooms(connection).detect {|r| r[:name] == name}
        new(connection, room)
      end
    end

    def initialize(connection, room)
      @connection = connection
      @room = room
    end

    def id
      @room[:id]
    end

    def name
      @room[:name]
    end

    def speak(message)
      @connection.speak(id, message)
    end

    def watch(&block)
      @connection.watch(id, &block)
    end
  end
end

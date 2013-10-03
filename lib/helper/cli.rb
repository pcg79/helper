module Helper
  class CLI
    def initialize(args)
      @options = parse_args(args)

      register_handlers
    end

    def parse_args(args)
      options = {}

      OptionParser.new do |parser|
        parser.banner = [
          "Usage: #{@name} [-c config_file] [-r room_name]\n",
          "       #{@name} --help\n"
        ].compact.join

        parser.on('-c', '--config FILE') do |path|
          options[:config_path] = path
        end

        parser.on('-s', '--subdomain SUBDOMAIN') do |subdomain|
          options[:subdomain] = subdomain
        end

        parser.on('-t', '--token TOKEN') do |token|
          options[:token] = token
        end

        parser.on('-r', '--room ROOM') do |room_name|
          (options[:room_names] ||= []) << room_name
        end

        parser.on_tail("-?", "--help", "Display this usage information.") do
          puts "#{parser}\n"
          exit
        end
      end.parse!(args)

      options
    end

    def config
      @config ||= Configuration.new(@options[:config_path], @options)
    end

    def run
      RoomSupervisor.new(router, rooms)
    end

    def router
      @router ||= Router.new(config.bot_name)
    end

    def rooms
      @rooms ||= begin
        config.room_names.map do |room_name|
          Room.find_by_name(connection, room_name)
        end
      end
    end

    def connection
      @connection = Sparks.new config.subdomain, config.token, {
        verify_mode: OpenSSL::SSL::VERIFY_NONE,
        socket_class: Celluloid::IO::TCPSocket,
        ssl_socket_class: Celluloid::IO::SSLSocket
      }
    end

    def register_handlers
      Handler.descendants.each do |handler|
        router.add_route(handler.pattern, handler)
      end
    end
  end
end

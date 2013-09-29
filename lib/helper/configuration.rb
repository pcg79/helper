module Helper
  class Configuration
    def initialize(config_path, options)
      @options = (YAML.load_file(config_path) rescue {}).merge(options)
    end

    def bot_name
      @options[:bot_name] || "helper"
    end

    def subdomain
      @options[:subdomain]
    end

    def token
      @options[:token]
    end

    def room_names
      @options[:room_names] || []
    end
  end
end

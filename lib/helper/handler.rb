module Helper
  module Handler
    def self.included(h)
      self.descendants << h
    end

    def self.descendants
      @descendants ||= []
    end

    def respond(room)
      raise NotImplementedError, "abstract"
    end
  end
end

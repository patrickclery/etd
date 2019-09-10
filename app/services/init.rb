module App
  class Init

    attr_reader :client

    class << self
      def call(**options)
        @client = App::GetClient.call(**options)
      end
    end
  end
end

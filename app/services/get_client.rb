module App
  class GetClient
    attr_accessor :client

    class << self
      def call(consumer_key:, consumer_secret:, token: nil, sandbox: true)
        @client ||= EvernoteOAuth::Client.new(consumer_key:    consumer_key,
                                              consumer_secret: consumer_secret,
                                              token:           token,
                                              sandbox:         sandbox)
      end
    end
  end
end

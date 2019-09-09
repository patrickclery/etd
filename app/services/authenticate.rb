module App
  class Authenticate
    attr_accessor :client

    class << self
      def call(consumer_key:, consumer_secret:, token: nil, sandbox: true)
        @client ||= EvernoteOAuth::Client.new(token:           token,
                                              consumer_key:    consumer_key,
                                              consumer_secret: consumer_secret,
                                              sandbox:         sandbox)
      end
    end
  end
end

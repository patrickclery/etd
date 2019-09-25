module App
  class GetEvernoteClient
    attr_accessor :evernote

    class << self
      def call(consumer_key:, consumer_secret:, token: nil, sandbox: true)
        EvernoteOAuth::Client.new(consumer_key:    consumer_key,
                                  consumer_secret: consumer_secret,
                                  token:      token,
                                  sandbox:         sandbox)
      end
    end
  end
end

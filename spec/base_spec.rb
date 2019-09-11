RSpec.describe App::Base do
  include_context 'default_context'
  subject do
    App::Base.new.tap do |obj|
      obj.consumer_key    = consumer_key
      obj.consumer_secret = consumer_secret
      obj.token           = nil
      obj.sandbox         = true
    end
  end

  it { is_expected.to have_attributes(client: an_instance_of(EvernoteOAuth::Client)) }
  it { is_expected.to have_attributes(consumer_key:    consumer_key,
                                      consumer_secret: consumer_secret,
                                      token:           nil,
                                      sandbox:         true) }
end

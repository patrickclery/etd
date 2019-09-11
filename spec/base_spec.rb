RSpec.describe App::Base do
  include_context 'default_context'
  subject { App::Base.new(consumer_key:    consumer_key,
                          consumer_secret: consumer_secret,
                          token:           nil,
                          sandbox:         true) }

  it { is_expected.to have_attributes(evernote: an_instance_of(EvernoteOAuth::Client)) }
end

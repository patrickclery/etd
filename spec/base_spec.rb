RSpec.describe App::Base do
  include_context 'default'
  include_context 'sandbox'

  let(:note_store_url) { 'https://sandbox.evernote.com/oauth' }
  let(:auth_token) { ENV['evernote_auth_token'] }
  subject do
    App::Base.new.tap do |obj|
      obj.consumer_key    = consumer_key
      obj.consumer_secret = consumer_secret
      obj.auth_token      = auth_token
      obj.sandbox         = sandbox
      obj.note_store_url  = note_store_url
    end
  end

  # Interface
  it { is_expected.to respond_to(:en_user,
                                 :note_count,
                                 :note_store,
                                 :notebooks,
                                 :total_note_count,
                                 :user_store) }

  it { is_expected.to have_attributes(client: an_instance_of(EvernoteOAuth::Client)) }
  it { is_expected.to have_attributes(consumer_key:    consumer_key,
                                      consumer_secret: consumer_secret,
                                      auth_token:      auth_token,
                                      sandbox:         sandbox,
                                      note_store_url:  note_store_url) }
end

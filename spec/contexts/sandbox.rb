RSpec.shared_context "sandbox" do

  before(:each) { WebMock.allow_net_connect! }
  after(:each) { WebMock.disable_net_connect! }

  # These are specified by your IDE
  let(:note_store_url) { 'https://sandbox.evernote.com/oauth' }
  let(:consumer_key) { ENV['evernote_consumer_key'] }
  let(:consumer_secret) { ENV['evernote_consumer_secret'] }
  let(:token) { ENV['evernote_token'] }

end

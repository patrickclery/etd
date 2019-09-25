RSpec.shared_context "default" do
  subject { described_class }

  let(:tmp_file) { Tempfile.new('rspec.output') }

  # EvernoteOAuth Client-related
  let(:client) { EvernoteOAuth::Client.new(**params) }
  let(:params) { { consumer_key:    consumer_key,
                   consumer_secret: consumer_secret,
                   token:           token,
                   sandbox:         sandbox } }
  let(:consumer_key) { 'barbara' } # username
  let(:consumer_secret) { '0123456789abcdef' } # 16 chars
  let(:token) { 'ghijkl9876543210' }
  let(:sandbox) { true }

end

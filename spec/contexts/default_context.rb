RSpec.shared_context "default_context" do

  subject { described_class }
  let(:evernote) { App::Base.new(consumer_key:    consumer_key,
                                 consumer_secret: consumer_secret,
                                 token:           nil,
                                 sandbox:         true) }

  let(:tmp_file) { Tempfile.new('rspec.output') }

  # Shared context goes here
  let(:consumer_key) { 'barbara' } # username
  let(:consumer_secret) { '0123456789abcdef' } # 16 chars
  let(:token) { 'ghijkl9876543210' }

end

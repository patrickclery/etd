RSpec.describe App::GetClient do

  include_context 'default_context'

  it { should respond_to(:call).with_keywords(:token, :consumer_key, :consumer_secret, :sandbox) }

  it 'can return an evernote client' do
    expect(EvernoteOAuth::Client).to receive(:new).with({ consumer_key:    'barbara',
                                                          consumer_secret: '0123456789abcdef',
                                                          token:           nil,
                                                          sandbox:         true })
    subject.call(consumer_key:    'barbara',
                 consumer_secret: '0123456789abcdef',
                 token:           nil,
                 sandbox:         true)
  end
end

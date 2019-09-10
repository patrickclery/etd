RSpec.describe App::GetClient do

  include_context 'default_context'

  it { should respond_to(:call).with_keywords(:token, :consumer_key, :consumer_secret, :sandbox) }

  it 'delegates the call to the Evernote client' do
    expect(EvernoteOAuth::Client).to receive(:new).with({ consumer_key:    'barbara',
                                                          consumer_secret: '0123456789abcdef',
                                                          token:           nil,
                                                          sandbox:         true })
    subject.call(consumer_key:    'barbara',
                 consumer_secret: '0123456789abcdef',
                 token:           nil,
                 sandbox:         true)
  end
  context 'Mock Request' do
    before(:each) do
      allow(EvernoteOAuth::Client).to receive(:new).with({ consumer_key:    'barbara',
                                                           consumer_secret: '0123456789abcdef',
                                                           token:           nil,
                                                           sandbox:         true })
                                        .and_return(EvernoteOAuth::Client.new)
    end

    it 'returns an instance of an Evernote API Client' do
      func = -> { subject.call(consumer_key:    'barbara',
                               consumer_secret: '0123456789abcdef',
                               token:           nil,
                               sandbox:         true) }

      expect(func.call).to be_an_instance_of(EvernoteOAuth::Client)
    end
  end
end

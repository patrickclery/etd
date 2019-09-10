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
  context 'with Evernote execution disabled' do
    before(:each) do
      client = double("EvernoteOAuth::Client")
      dbl = double(EvernoteOAuth::Client.new)
      allow(client).to receive(:new).with({ consumer_key:    'barbara',
                                            consumer_secret: '0123456789abcdef',
                                            token:           nil,
                                            sandbox:         true }).and_return(dbl)
    end

    it 'returns an instance of an Evernote API Client' do
      func = -> { subject.call(consumer_key:    'barbara',
                               consumer_secret: '0123456789abcdef',
                               token:           nil,
                               sandbox:         true) }

      expect(func.call).to be_a_kind_of(EvernoteOAuth::Client)
    end
  end
end

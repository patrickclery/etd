RSpec.describe App::Authenticate do

  include_context 'default_context'

  it { should respond_to(:call).with_keywords(:token, :consumer_key, :consumer_secret) }

  it 'can connect to the Evernote API' do
    pending
    fail
  end

end

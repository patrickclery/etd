RSpec.describe App::UpdateNotebookTag do
  include_context 'default'

  let(:app) do
    App::Base.new(consumer_key:    consumer_key,
                  consumer_secret: consumer_secret,
                  token:           nil,
                  sandbox:         true)
  end

  before do
    allow(EvernoteOAuth::Client).to receive(:new).with({ consumer_key:    consumer_key,
                                                         consumer_secret: consumer_secret,
                                                         token:           nil,
                                                         sandbox:         true }).and_return(EvernoteOAuth::Client.new)
    stub_request(:post, "https://sandbox.evernote.com/edam/user")
      .with(:anything)
      .to_return(status: 200, body: "", headers: {})
  end

  it { should respond_to(:call).with_keywords(:notebook_name) }

  it 'can tag each note in a notebook' do
    note_count = app.note_count(tag_name: '#awesome_project')
    expect(note_count).to eq 0
    expect(subject.call(notebook_name: 'Awesome Project')).to eq 3
  end

end

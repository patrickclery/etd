RSpec.describe 'update all notes in a notebook' do
  include_context 'default'

  let(:token) { nil }

  before(:each) do
    allow(EvernoteOAuth::Client).to receive(:new).with({ consumer_key:    'barbara',
                                                         consumer_secret: '0123456789abcdef',
                                                         token:      nil,
                                                         sandbox:         true }).and_return(EvernoteOAuth::Client.new)
  end

  it 'can tag each note in a notebook' do
    expect(client.note_count(tag_name: '#awesome_project')).to eq 0
    expect(client.tag_notebook('Awesome Project')).to eq true
    expect(client.note_count(tag_name: '#awesome_project')).to eq 3
  end
end

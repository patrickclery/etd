RSpec.describe 'update all notes in a notebook' do
  include_context 'default_context'

  it { should respond_to(:call).with_keywords(:notebook_name) }

  it 'can tag each note in a notebook' do
    note_count = evernote_client.get_note_count(tag_name: '#awesome_project')
    expect(note_count).to eq 0

    expect(evernote.get_count_by_tag(notebook_name: 'Awesome Project')).to eq 3
  end
end

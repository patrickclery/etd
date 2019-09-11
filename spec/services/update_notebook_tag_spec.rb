RSpec.describe App::UpdateNotebookTag do
  include_context 'default_context'

  it { should respond_to(:call).with_keywords(:notebook_name) }

  it 'can tag each note in a notebook' do
    note_count = evernote.evernote(tag_name: '#awesome_project')
    expect(note_count).to eq 0
    expect(subject.call(notebook_name: 'Awesome Project')).to eq 3
  end

end

RSpec.describe App::UpdateNotebookTag do
  include_context 'default'

  let(:app) do
    App::Base.new.tap do |obj|
      obj.consumer_key    = consumer_key
      obj.consumer_secret = consumer_secret
      obj.token      = nil
      obj.sandbox         = true
    end
  end

  it { should respond_to(:call).with_keywords(:notebook_name) }

  it 'can tag each note in a notebook' do
    note_count = app.note_count(tag_name: '#awesome_project')
    expect(note_count).to eq 0
    expect(subject.call(notebook_name: 'Awesome Project')).to eq 3
  end

end

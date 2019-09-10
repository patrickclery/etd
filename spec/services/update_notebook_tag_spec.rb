RSpec.describe App::UpdateNotebookTag do
  include_context 'default_context'

  it { should respond_to(:call).with_keywords(:notebook_name) }

  context 'when a notebook name is supplied' do
    subject { described_class.call(notebook_name: 'Awesome Project') }

    it { should eq '#awesome_project' }
  end

end

RSpec.describe App::Init do

  # As a user
  # I want to automatically tag any notes I add to a notebook

  include_context 'default_context'

  it { should respond_to(:call) }

end

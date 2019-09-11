RSpec.describe 'Shell application' do

  include_context 'default'

  it 'is executable from the command-line' do
    expect(File.executable?("./app.rb")).to be true
  end

  # Use this test if you use any switches
  it 'can accept an output file as an argument' do
    pending
    fail
    # exit_status = system("./application.rb -o #{tmp_file.path}")
    # expect(exit_status).to be true
    #
    # csv = File.open(tmp_file.path)
    # expect(csv.size).to be_nonzero
  end

end

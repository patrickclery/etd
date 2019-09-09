RSpec.shared_context "default_context" do

  subject { described_class }

  let(:tmp_file) { Tempfile.new('rspec.output') }

  # Shared context goes here

end

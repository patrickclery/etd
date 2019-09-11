require "bundler/setup"
require "./app/boot"
require 'contexts/default'
require 'contexts/sandbox'
require 'examples/default_examples'
require 'webmock/rspec'
require 'factory_bot'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

WebMock.enable!

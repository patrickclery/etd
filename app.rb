#!/usr/bin/env ruby

require './app/boot'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: app.rb [options]"
=begin

### Adding Custom Options to your Shell Script

- Add an option

  ```ruby
  opts.on("--html", "Output in HTML format (default is CSV)") do
    options[:format] = :html
  end
  ```
- Add an option with parameters

  ```ruby
  opts.on("-o FILE", "--output-file=FILE", String, "File to output to. (Default: 'results.{csv,html}')") do |output_file|
    options[:output_file] = output_file
  end
  ```

=end
  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit 1
  end
end.parse!(into: {})

App::Init.call(**options)

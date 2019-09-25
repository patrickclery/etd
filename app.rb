#!/usr/bin/env ruby

require './app/boot'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: app.rb [options]"
  opts.on("-t TOKEN", "--auth-token=TOKEN", String, "Evernote OAuth Key") do |token|
    options[:token] = token
  end
  opts.on("-k KEY", "--consumer-key=KEY", String, "Evernote OAuth Key") do |consumer_key|
    options[:consumer_key] = consumer_key
  end
  opts.on("-s SECRET", "--consumer-secret=SECRET", String, "Evernote OAuth Secret") do |consumer_secret|
    options[:consumer_secret] = consumer_secret
  end
  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit 1
  end
end.parse!(into: {})

# Fallback to Env Vars
options[:consumer_key]    ||= ENV['evernote_consumer_key']
options[:consumer_secret] ||= ENV['evernote_consumer_secret']
options[:token]           ||= ENV['evernote_auth_token']

client = App::Base.new(**options)

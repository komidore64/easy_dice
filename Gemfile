# vim:ft=ruby

source 'https://rubygems.org'

gemspec

# load local gemfile
local_gemfile = File.join(File.dirname(__FILE__), 'Gemfile.local')
instance_eval(Bundler.read_file(local_gemfile)) if File.exist?(local_gemfile)

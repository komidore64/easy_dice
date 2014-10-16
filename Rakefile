require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = [ "test/helper.rb" ]
end

RuboCop::RakeTask.new(:rubocop)

desc "run easy_dice tests, bro"
task :default => [:test]

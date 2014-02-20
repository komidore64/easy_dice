require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = [ "test/helper.rb" ]
end

desc "run easy_dice tests, bro"
task :default => [:test]

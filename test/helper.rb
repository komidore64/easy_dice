# simplecov
require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/autorun'
require 'debugger'

require 'easy_dice'

Dir["./test/**/*_test.rb"].each do |f|
  require f
end

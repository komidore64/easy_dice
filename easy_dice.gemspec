# easy_dice.gemspec

Gem::Specification.new do |s|
  s.name = "easy_dice"
  s.version = "0.0.1"
  s.date = "2013-07-20"
  s.summary = "Super simple gem for rolling polyhedral dice."
  s.description = "Super simple gem for rolling polyhedral dice."
  s.authors = ["Adam Price"]
  s.email = "komidore64@gmail.com"
  s.files = [
    "lib/easy_dice.rb",
    "lib/easy_dice/dice.rb",
    "lib/easy_dice/easy_dice.rb",
    "lib/easy_dice/format_error.rb",
    "lib/easy_dice/fixnum_d.rb"
  ]
  s.executables << "roll"
  s.homepage = "http://rubygems.org/gems/easy_dice"
end

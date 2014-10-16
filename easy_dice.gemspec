#
# Copyright (C) 2013 Adam Price (komidore64 at gmail dot com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require './lib/easy_dice/version'

Gem::Specification.new do |s|
  s.name        = "easy_dice"
  s.version     = EasyDice::VERSION
  s.authors     = ["Adam Price"]
  s.email       = ["komidore64@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/easy_dice"
  s.summary     = "Simple gem for rolling dice."
  s.description = "Gem for rolling polyhedral dice."
  s.licenses    = ["GPL-3"]

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = ["roll"]

  s.add_development_dependency("rake", "~>10.1")
  s.add_development_dependency("minitest", "~>4.3")
  s.add_development_dependency("simplecov", "~>0.7")
  s.add_development_dependency("rubocop", "0.26.1")
end

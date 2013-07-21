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

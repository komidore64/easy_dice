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

class EasyDice

  # this is the format that EasyDice#read will accept
  READ_FORMAT = /\A((\d+)(d(\d+))?\s*[\+\-]\s*)*(\d+)(d(\d+))?\z/i

  # i don't actually use these named groups,
  # but they make String#scan work like i want it
  # so i'll leave them in. not complaining.
  DIE_PATTERN = /(?<count>\d+)(d(?<sides>\d+))?/

  def self.read(str)
    check_format!(str)
    results = str.scan(DIE_PATTERN)
    cleanup(results)

    # top of the linked list
    hand = Dice.new(results[0][0], results[0][1])
    results.shift

    # tack on the rest
    results.each do |res|
      hand += Dice.new(res[0], res[1])
    end
    hand
  end

  private

  def self.cleanup(results)
    results.each do |res|
      res[0] = res[0].to_i
      res[1] = res[1].nil? ? 1 : res[1].to_i
    end
  end

  def self.check_format!(str)
    str.strip!
    if str.match(READ_FORMAT).nil?
      raise EasyDice::FormatError, "String [ %s ] contains incorrect dice formatting." % str
    end
  end

end

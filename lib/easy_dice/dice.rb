# dice.rb
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

class Dice

  def initialize(count, sides = 1)
    @count, @sides = count, sides
  end

  def roll
    total = @count.times.inject(0) { |total, _| total += rand(@sides) + 1 }
    total += @child.roll unless @child.nil?
    total
  end

  def +(n)
    n = Dice.new(n) if n.class == Fixnum
    n.parent = self
    bottom.child = n
    top
  end

  def minimum
    min = @count
    min += @child.minimum unless @child.nil?
    min
  end

  def maximum
    max = @sides > 1 ? @sides * @count : @count
    max += @child.maximum unless @child.nil?
    max
  end

  def to_s
    str = @sides > 1 ? "#{@count}d#{@sides}" : "#{@count}"
    str << " + #{@child.to_s}" unless @child.nil?
    str
  end

  alias min minimum
  alias max maximum

  protected

  attr_accessor :parent, :child

  def top
    return @parent.nil? ? self : @parent.top
  end

  def bottom
    return @child.nil? ? self : @child.bottom
  end

end

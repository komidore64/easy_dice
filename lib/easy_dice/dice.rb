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
  attr_reader :count, :sides, :parent, :child

  def initialize(count, sides = 1)
    @count, @sides = count, sides
  end

  def roll
    total = @count.times.reduce(0) do |t, _|
      t += rand(@sides) + 1
      t
    end
    total += @child.roll unless @child.nil?
    total
  end

  def +(other)
    other = Dice.new(other) if other.class == Fixnum
    other.parent = self
    bottom.child = other
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
    str << " + #{@child}" unless @child.nil?
    str
  end

  alias_method :min, :minimum
  alias_method :max, :maximum

  protected

  attr_writer :parent, :child

  def top
    @parent.nil? ? self : @parent.top
  end

  def bottom
    @child.nil? ? self : @child.bottom
  end
end

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

class DiceTest < MiniTest::Unit::TestCase

  def teardown
    GC.start
  end

  def test_explicit_creation
    d = Dice.new(1, 6)
    assert_equal(d.class, Dice)
  end

  def test_fixnum_method_creation
    d = 1.d(20)
    assert_equal(Dice, d.class)
  end

  def test_sides
    d = 1.d(8)
    assert_equal(8, d.sides)
  end

  def test_count
    d = 12.d(6)
    assert_equal(12, d.count)
  end

  def test_max
    d = 3.d(4)
    assert_equal(12, d.max)
    assert_equal(12, d.maximum)
  end

  def test_min
    d = 2.d(8)
    assert_equal(2, d.min)
    assert_equal(2, d.minimum)
  end

  def test_string
    d = 1.d(10)
    assert_equal("1d10", d.to_s)
  end

  def test_string_multidice
    d = 1.d(8) + 1.d(6) + 8
    assert_equal("1d8 + 1d6 + 8", d.to_s)
  end

  def test_plus
    d1 = 1.d(8)
    d2 = 1.d(6)
    hand = d1 + d2
    assert_equal(d1, d2.parent)
    assert_equal(d2, d1.child)
    assert_equal(d1, hand)
  end

  def test_mod_creation
    d = Dice.new(6)
    assert_equal(Dice, d.class)
  end

  def test_mod_count
    d = Dice.new(4)
    assert_equal(4, d.count)
  end

  def test_mod_sides
    d = Dice.new(2)
    assert_equal(1, d.sides)
  end

  def test_plus_mod
    d1 = 1.d(8)
    d2 = 6
    hand = d1 + d2
    ObjectSpace.each_object(Dice) do |o|
      # grab the object from the garbage collector
      d2 = o if o.count == 6 && o.sides == 1
    end
    assert_equal(d1.child, d2)
  end

  def test_roll
    d = 1.d(20)
    1000.times do |_|
      assert_includes((1..20).to_a, d.roll)
    end
  end

end

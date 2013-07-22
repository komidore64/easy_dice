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

class EasyDiceTest < MiniTest::Unit::TestCase

  def test_read_happy_path
    d = EasyDice.read("1d12")
    assert_equal(Dice, d.class)
  end

  def test_read_multidice_types_happy_path
    hand = EasyDice.read("1d8 + 1d6")
    assert_equal(Dice, hand.class)
  end

  def test_read_multidice_with_mod_happy_path
    hand = EasyDice.read("1d8 + 1d6 + 8")
    assert_equal(Dice, hand.class)
  end

  def test_read_multidice_with_mod_happy_path_no_spaces
    hand = EasyDice.read("1d8+1d6+8")
    assert_equal(Dice, hand.class)
  end

  def test_read_bad_format
    bad_strings = [ "asdf",
                    "d6",
                    "4.5d6",
                    "5d2.3",
                    "1d6 +",
                    "+ 7" ]
    bad_strings.each do |test_str|
      assert_raises(EasyDice::FormatError) { EasyDice.read(test_str) }
    end
  end

end

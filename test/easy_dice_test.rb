require 'helper'

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

# dice.rb

# usage
# =====
# irb> set = 1.d(8) + 1.d(6) + 3
# => #<Dice:0x... @count=1, ... >
# irb> set.roll
# => 20
# irb> (4.d(6) + 2.d(10) + 10).roll
# => 26
# irb> roll(12.d(6))
# => 45

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

  protected

  attr_accessor :count, :sides
  attr_accessor :parent, :child

  def top
    return self if @parent.nil?
    @parent.top
  end

  def bottom
    return self if @child.nil?
    @child.bottom
  end

end

class Fixnum
  def d(sides)
    Dice.new(self, sides)
  end
end

class Object
  def roll(d)
    raise "you can only roll dice, bro" unless d.class == Dice
    d.roll
  end
end

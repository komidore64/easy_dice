# dice.rb

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
    min += @child.minimum
    min
  end

  def maximum
    max = @sides > 1 ? @sides : @count
    max += @child.maximum
    max
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

class Fixnum
  def d(sides)
    Dice.new(self, sides)
  end
end

class NilClass
  [:maximum, :minimum].each do |method|
    define_method(method) { 0 }
  end
end

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

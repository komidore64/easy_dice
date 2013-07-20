class EasyDice::FormatError < RuntimeError

  def initialize(msg = "Incorrect dice format")
    super(msg)
  end

end

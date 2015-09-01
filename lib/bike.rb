class Bike

  def initialize
    @broken = false  #could replace this with just 'fix' to refactor but unclear
  end

  def broken?
    @broken
  end

  def break
    @broken = true
  end

  def fix
    @broken = false
  end

end
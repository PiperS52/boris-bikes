class Bike
  attr_accessor :broken

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def fix
    @broken = false
  end 
end

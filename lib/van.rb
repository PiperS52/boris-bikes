class Van

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def load(bike)
    #add_bike
  end

  def unload(bike)
    #remove_bike
  end

end

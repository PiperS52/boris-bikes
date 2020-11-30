class Garage

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def store(bike)
    #add_bike
  end

  def unstore(bike)
    #remove_bike
  end 

end

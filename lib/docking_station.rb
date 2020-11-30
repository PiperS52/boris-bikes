require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'no bikes available' if empty? || all_bikes_broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'docking station full' if full?
    @bikes << bike
  end

  private

  def all_bikes_broken?
    @bikes.all?(&:broken?)
  end
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

require_relative 'bike_container'
require_relative 'bike'

class Garage
  include BikeContainer

  def store(bike)
    add_bike(bike)
    fix_bikes
  end

  def release
    remove_bike
  end

  private

  def fix_bikes
    bikes.each { |bike| bike.fix }
  end

end

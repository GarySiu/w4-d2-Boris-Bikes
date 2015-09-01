class Garage

  DEFAULT_CAPACITY = 200
  attr_accessor :bikes

  def initialize options = {}
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def bike_count
    @bikes.count
  end

  def drop_off bike
    raise 'Garage is full' if full?
    @bikes << bike
  end

  def send_bike(bike, van)
    departing_bike = @bikes.delete(bike)
    van.bikes << departing_bike
  end

  def full?
    bike_count == @capacity
  end

  def send_to_capacity van
    while !van.full? && !@bikes.empty?
      unloaded_bike = @bikes.pop
      van.bikes << unloaded_bike
    end
  end


end
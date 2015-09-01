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

  def send_bike bike
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end


end
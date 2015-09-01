class DockingStation

DEFAULT_CAPACITY = 5

  def initialize options = {}
    @bikes = []
    # @capacity = options[:capacity]
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def bike_count
    @bikes.count
  end

  def dock bike
    raise 'Station is full' if full?
    @bikes << bike
  end

  def release bike
    @bikes.delete bike
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    @bikes.reject { |bike| bike.broken? }
  end
  
end
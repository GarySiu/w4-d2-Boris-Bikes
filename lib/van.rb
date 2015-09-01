class Van
  
  DEFAULT_CAPACITY = 20
  attr_accessor :bikes

  def initialize options = {}
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def bike_count
    @bikes.count
  end

  def load bike
    raise 'Van is full' if full?
    @bikes << bike
  end

  def unload(bike, destination)
    unloaded_bike = @bikes.delete(bike)
    destination.bikes << unloaded_bike
  end

  def full?
    bike_count == @capacity
  end

  def dump destination
    while !destination.full? && @bikes.size > 0
      unloaded_bike = @bikes.pop
      destination.bikes << unloaded_bike
    end
  end

 end
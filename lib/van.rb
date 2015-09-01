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
    unloaded_bike.fix if destination.instance_of? Garage
    destination.bikes << unloaded_bike
  end

  def full?
    bike_count == @capacity
  end

  def dump destination
    while !destination.full? && !@bikes.empty?
      unloaded_bike = @bikes.pop
      unloaded_bike.fix if destination.instance_of? Garage
      destination.bikes << unloaded_bike
    end
  end

 end
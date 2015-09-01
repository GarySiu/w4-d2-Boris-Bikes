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

  def unload bike
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end

 end
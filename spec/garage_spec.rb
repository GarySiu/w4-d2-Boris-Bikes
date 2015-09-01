require_relative '../lib/garage'

  def fill_garage
    200.times { garage.drop_off(Bike.new) }
  end

describe Garage do

  let(:garage) { Garage.new capacity: 200 }
  let(:bike) { Bike.new }
  let(:van) { Van.new}

# The main difference between the garage beyond it's larger capacity
# is the bike need to be dropped off and sent via vans

  it 'should be able to receive a bike from a van' do
    van.load bike
    van.unload(bike, garage)
    expect(garage.bikes).to eq [bike]
  end

  it 'should be able to load a bike to a van' do

# Load a bike into the garage    
    van.load bike
    van.unload(bike, garage)

# Take the bike back out of the garage and put it back in the van

    garage.send_bike(bike, van) 
    expect(garage.bike_count).to eq 0
  end

# Also we need to fix the broken bikes before sending them out


##  This code is essentially the same as the docking station ##

  it 'should be empty when we create it' do
    expect(garage.bike_count).to eq 0
  end

  it 'should know when the garage is full' do
    fill_garage
    expect(garage.full?).to be true
  end

  it 'should not let you drop off any more bikes if the garage is full' do
    fill_garage
    expect{garage.drop_off(bike)}.to raise_error 'Garage is full'
  end

##                    end of common code                     ##


end
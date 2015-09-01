require_relative '../lib/garage'

  def fill_garage
    200.times { garage.load(Bike.new) }
  end

describe Garage do

  let(:garage) { Garage.new capacity: 200 }
  let(:bike) { Bike.new }

##  This code is essentially the same as the docking station ##

  it 'should be empty when we create it' do
    expect(garage.bike_count).to eq 0
  end

  it 'should be able to drop off bikes to the garage' do
    garage.drop_off bike
    expect(garage.bike_count).to eq 1
  end

  it 'should be able to send bikes from the garage' do
    garage.send_bike bike 
    unloaded_bike = garage.unload bike
    expect(garage.bike_count).to eq 0
  end

  it 'should know when the garage is fully loaded' do
    fill_garage
    expect(garage.full?).to be true
  end

  it 'should not let you load the garage if it is full' do
    fill_garage
    expect{garage.load(bike)}.to raise_error 'Garage is full'
  end

##                    end of common code                     ##


end
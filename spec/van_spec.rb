require_relative '../lib/van'

describe Van do

  def fill_van
    30.times { van.load(Bike.new) }
  end

  let(:van) { Van.new capacity: 30 }
  let(:bike) { Bike.new }

##  This code is essentially the same as the docking station ##

  it 'should be empty when we create it' do
    expect(van.bike_count).to eq 0
  end

  it 'should be able to load bikes' do
    van.load bike
    expect(van.bike_count).to eq 1
  end

  it 'should be able to unload bikes' do
    van.load bike
    garage = Garage.new
    van.unload(bike,garage)
    expect(van.bike_count).to eq 0
  end

  it 'should know when the van is fully loaded' do
    fill_van
    expect(van.full?).to be true
  end

  it 'should not let you load the van if it is full' do
    fill_van
    expect{van.load(bike)}.to raise_error 'Van is full'
  end

##                    end of common code                     ##



end
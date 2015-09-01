require_relative '../lib/van'
describe Van do

let(:van) { Van.new }
let(:bike) { Bike.new }

  it 'should be empty when we create it' do
    expect(van.bike_count).to eq 0
  end

  it 'should be able to load bikes to the van' do
    van.load bike
    expect(van.bike_count).to eq 1
  end

  it 'should be able to unload bikes from the van' do
    van.load bike 
    unloaded_bike = van.unload bike
    expect(van.bike_count).to eq 0
  end

end
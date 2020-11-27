require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

  it { is_expected.to respond_to(:bikes) }

  it "has a default capacity" do
    ds = DockingStation.new
    expect(ds.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "has a variable capacity" do
    ds = DockingStation.new(20)
    20.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error 'docking station full'
  end

  describe '#release_bike' do
    it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "docks bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to include(bike)
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'docking station full'
    end
  end

end

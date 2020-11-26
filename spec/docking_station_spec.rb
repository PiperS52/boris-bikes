require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

  #describe '#release_bike' do
    # it 'releases working bikes' do
    #   bike = subject.release_bike
    #   expect(bike).to be_working

  describe '#release_bike' do
    it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes available' do
      # subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it "docks bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "return docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#dock' do
    it 'raises an error when full' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'docking station full'
    end
  end
end

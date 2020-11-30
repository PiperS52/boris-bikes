require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

  it { is_expected.to respond_to(:bikes) }

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
    end

    # it 'releases working bikes' do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

    # testing that there is one bike in the docking_station and that same
    # bike gets returned by release_bike
    let(:bike) { double :bike }
    it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end

    # it 'raises an error when trying to release a broken bike' do
    #   bike = Bike.new
    #   bike.report_broken
    #   subject.dock(bike)
    #   expect { subject.release_bike }.to raise_error 'no bikes available'
    # end

    let(:bike) { double :bike }
    it 'raises an error when trying to release a broken bike' do
      allow(bike).to receive(:broken?).and_return(true)
      bike = double(:bike, broken?: true, report_broken: true)
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  let(:bike) { double :bike }
  it "docks bike" do
    expect(subject.dock(bike)).to include(bike) # try changing
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock double(:bike) }.to raise_error 'docking station full'
    end
  end

end

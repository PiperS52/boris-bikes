require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it_behaves_like BikeContainer

  let(:working_bike_double) { double :bike, broken?: false }
  let(:broken_bike_double) { double :bike, broken?: true, report_broken: true }
  let(:bike_double) { double :bike }

  describe '#release_bike' do

    it 'releases a working bike' do
        subject.dock(broken_bike_double)
        subject.dock(working_bike_double)
        expect(subject.release_bike).to be working_bike_double
    end

    it 'raises an error if only broken bikes in docking station' do
      subject.dock(broken_bike_double)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it 'raises an error when docking station completely empty' do
      subject.dock(working_bike_double)
      subject.release_bike
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a bike regardless of whether broken or not" do
      expect(subject.dock(bike_double)).to include(bike_double)
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.dock(working_bike_double) }
      expect { subject.dock(working_bike_double) }.to raise_error 'DockingStation full'
    end
  end

end

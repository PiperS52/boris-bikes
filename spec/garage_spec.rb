require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
  it_behaves_like BikeContainer

  subject { described_class.new }
  let(:working_bike_double) { double :bike, broken?: false }
  let(:broken_bike_double) { double :bike, broken?: true }
  let(:bike_double) { double :bike }

  describe '#store' do
    it 'stores bikes' do
      allow(bike_double).to receive(:fix)
      expect(subject.store(bike_double)).to include(bike_double)
    end

    it 'fixes broken bikes after being stored' do
      expect(broken_bike_double).to receive(:fix)
      subject.store(broken_bike_double)
    end

    it 'raises an error if full' do
      allow(bike_double).to receive(:fix)
      subject.capacity.times { subject.store(bike_double) }
      expect { subject.store(bike_double) }.to raise_error 'Garage full'
    end
  end

  describe '#release' do
    it 'releases working bikes' do
      expect(broken_bike_double).to receive(:fix)
      subject.store(broken_bike_double)
      subject.release
    end

    it 'raises an error if empty' do
      expect { subject.release }.to raise_error "Garage empty"
    end
  end
end

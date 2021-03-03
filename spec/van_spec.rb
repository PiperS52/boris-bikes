require 'van'
require 'support/shared_examples_for_bike_container'

describe Van do
  it_behaves_like BikeContainer

  subject { described_class.new }
  let(:bike_double) { double :bike }

  describe '#load' do
    it 'loads a bike onto the van' do
      expect(subject.load(bike_double)).to include(bike_double)
    end

    it 'raises an error if full' do
      subject.capacity.times { subject.load(bike_double) }
      expect { subject.load(bike_double) }.to raise_error 'Van full'
    end
  end

  describe '#unload' do
    it 'unloads a bike from a van' do
      subject.load(bike_double)
      expect(subject.unload).to eq(bike_double)
    end

    it 'raises an error if empty' do
      expect { subject.unload }.to raise_error "Van empty"
    end
  end

end

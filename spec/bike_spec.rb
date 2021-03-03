require "bike"

describe Bike do

  subject { described_class.new }

  describe '#working?' do
    it 'confirms newly initialized bikes are working' do
      expect(subject.working?).to eq(true)
    end
  end

  describe '#report_broken' do
    it 'reports bikes as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end

  describe '#broken?' do
    it 'confirms whether a bike is broken or not' do
      subject.report_broken
      expect(subject.broken?).to eq(true)
    end
  end

  describe '#fix' do
    it 'allows bikes to be fixed' do
      subject.report_broken
      subject.fix
      expect(subject.broken?).to eq(false)
    end
  end
end

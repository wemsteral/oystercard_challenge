require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'displays balance on oystercard' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  end


end

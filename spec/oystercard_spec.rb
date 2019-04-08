require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'displays balance on oystercard' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'tops up an oystercard from 0 to 1' do
    # Our first test:
      # subject.top_up(1)
      # expect(subject.balance).to eq 1
    # This test will pass regardless of @balance's initial value: 
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end


end

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

    it 'raises an error if user attempts to top_up past 90' do
      oyster = Oystercard.new
      oyster.top_up(Oystercard::BALANCE_LIMIT)
      expect {oyster.top_up(1)}.to raise_error("maximum limit = #{Oystercard::BALANCE_LIMIT}")
    end
  end

    # describe '#deduct' do
    #   it 'deducts amount from balance' do
    #     oyster = Oystercard.new
    #     oyster.top_up(1)
    #     expect(oyster.deduct(1)).to eq 0
    #   end
    # end

  #back to oystercard as a whole
      it 'is initially not in a journey' do
        expect(subject).not_to be_in_journey
      end

      it 'can touch in' do
        subject.top_up(10)
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it 'can touch out' do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it 'deducts the fare when touch_out' do
        subject.top_up(10)
        subject.touch_in
        expect{ subject.touch_out}.to change{ subject.balance }.by -(Oystercard::MINIMUM_CHARGE)
      end

      describe '#touch_in' do
        it "raises an error if balance is less than #{Oystercard::LOW_LIMIT}" do
        expect { subject.touch_in }.to raise_error 'insufficient funds'
        end
      end

end

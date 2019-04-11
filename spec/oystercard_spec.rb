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
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if user attempts to top_up past 90' do
      oyster = Oystercard.new
      oyster.top_up(Oystercard::BALANCE_LIMIT)
      expect {oyster.top_up(1)}.to raise_error("maximum limit = #{Oystercard::BALANCE_LIMIT}")
    end
  end


    #back to oystercard as a whole
    describe '#initialize' do
      
      xit 'initially has an empty list of journeys' do
        expect(subject.journeys).to be_empty
      end
    end

      #touch in

    describe '#touch_in' do
      let(:entry_station){ double :station }

      xit 'can touch in' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        expect(subject).to be_in_journey
      end

      xit 'stores the entry station' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        expect(subject.entry_station).to eq entry_station
      end


      it "raises an error if balance is less than #{Oystercard::LOW_LIMIT}" do
        expect { subject.touch_in(entry_station) }.to raise_error 'insufficient funds'
      end
    end

   #touch out

   describe '#touch_out' do

     let(:entry_station){ double :station }
     let(:exit_station){ double :station }

     xit 'can touch out' do
       subject.top_up(10)
       subject.touch_in(entry_station)
       subject.touch_out(exit_station)
       expect(subject).not_to be_in_journey
     end

     xit 'deducts the fare when touch_out' do
       subject.top_up(10)
       subject.touch_in(entry_station)
       expect{ subject.touch_out(exit_station)}.to change{ subject.balance }.by -(Oystercard::MINIMUM_CHARGE)
     end

     xit 'saves exit station' do
       subject.top_up(10)
       subject.touch_in(entry_station)
       subject.touch_out(exit_station)
       expect(subject.exit_station).to eq exit_station
     end

     #journeys
     let(:journey){{"entry_station" => entry_station, "exit_station" => exit_station}}
     xit 'saves a journey' do
       subject.top_up(10)
       subject.touch_in(entry_station)
       subject.touch_out(exit_station)
       expect(subject.journeys).to include journey

     end
   end


end

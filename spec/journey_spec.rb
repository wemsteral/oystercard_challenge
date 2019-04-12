require 'journey'
require 'oystercard'

describe Journey do

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'knows if a jounrey is not complete' do
    expect(subject).not_to be_complete
  end

  it 'returns a penalty fare if no exit station is given' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end


  describe '#start_journey' do
    it 'saves station as entry station' do
      subject.start_journey(:station)
      expect(subject.entry_station).to eq :station
    end
  end
  describe '#finish_journey' do
    it 'saves station as exit station' do
      subject.finish_journey(:station)
      expect(subject.exit_station).to eq :station
    end
  end

 context 'given both stations' do
   let(:entry_station) { double :entry_station }
   let(:end_station) { double :end_station }

   it 'calculates a fare' do
     allow(subject).to receive(:complete?).and_return true
     expect(subject.fare).to eq 1
   end
 end 



end

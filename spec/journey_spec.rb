require 'journey'

describe Journey do

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
  
  describe '#start_journey' do
    it 'save station as entry station' do
      subject.start_journey(:station)
      expect(subject.entry_station).to eq :station
    end
  end
  describe '#finish_journey' do
    it 'save station as exit station' do
      subject.finish_journey(:station)
      expect(subject.exit_station).to eq :station
    end
  end
end

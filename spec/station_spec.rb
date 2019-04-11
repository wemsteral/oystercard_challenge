require 'station'

describe Station do

  context '#initialize' do
    s = Station.new(:station_name, :zone)
    it 'sets station name to instance variable' do
      expect(s.name).to eq :station_name
    end
    it 'sets station zone to instance variable' do
      expect(s.zone).to eq :zone 
    end
  end
end

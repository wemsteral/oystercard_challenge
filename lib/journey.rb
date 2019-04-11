require_relative 'oystercard'

class Journey
  attr_reader :entry_station, :exit_station

  def start_journey(station)
    @entry_station = station
  end

  def finish_journey(station)
    @exit_station = station
  end

  def in_journey?
    !!entry_station
  end


end

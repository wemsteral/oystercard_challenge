require_relative 'oystercard'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station


  def start_journey(station = nil)
    @entry_station = station
  end

  def finish_journey(station = nil)
    @exit_station = station
  end

  def in_journey?
    !!entry_station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    !@exit_station.nil? && !@entry_station.nil?
  end

end

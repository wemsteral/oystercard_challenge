require_relative 'journey'

class Oystercard

  BALANCE_LIMIT = 90
  LOW_LIMIT = 1


  attr_reader :balance, :journey_history

  def initialize
    @balance = 0
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(amount)
    fail "maximum limit = #{BALANCE_LIMIT}" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    fail 'insufficient funds' if @balance < LOW_LIMIT
    deduct(@journey.fare) if !@journey.entry_station.nil?
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish_journey(exit_station)
    deduct(@journey.fare)
    add_journey
    @journey = Journey.new
  end

  def add_journey
    @full_journey = { :entry => @journey.entry_station , :exit => @journey.exit_station }
    @journey_history << @full_journey
  end


  private

  def deduct(fare)
    @balance -= fare
  end

end

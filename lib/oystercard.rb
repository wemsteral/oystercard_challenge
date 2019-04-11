class Oystercard

  BALANCE_LIMIT = 90
  LOW_LIMIT = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journeys

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
    @journey.start_journey(entry_station)
    # @journey = {}
    # @journey["entry_station"] = @entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journey.finish_journey(exit_station)
    # @journey["exit_station"] = @exit_station
    # @journey_history << @journey
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end

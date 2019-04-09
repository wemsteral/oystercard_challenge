class Oystercard

  BALANCE_LIMIT = 90
  LOW_LIMIT = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance
  attr_reader :entry_station

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "maximum limit = #{BALANCE_LIMIT}" if (@balance + amount) > BALANCE_LIMIT

    @balance += amount
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  public

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail 'insufficient funds' if @balance < LOW_LIMIT
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

end

class Oystercard

  BALANCE_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    fail "maximum limit = #{BALANCE_LIMIT}" if (@balance + amount) > BALANCE_LIMIT

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @status
  end

  def touch_in
   @status = true
  end

  def touch_out
    @status = false
  end

end

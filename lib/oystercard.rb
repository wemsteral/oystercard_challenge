class Oystercard

  BALANCE_LIMIT = 90
  LOW_LIMIT = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @status = false
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
    @status
  end

  def touch_in
    fail 'insufficient funds' if @balance < LOW_LIMIT
   @status = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @status = false
  end

end

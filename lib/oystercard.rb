
class Oystercard

  attr_reader :balance, :in_journey

  alias_method :in_journey?, :in_journey

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "you cannot top up more than #{LIMIT}" if balance + amount > LIMIT
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in
    raise "insufficient funds: you need at least #{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end


  private
  attr_writer :balance, :in_journey

end

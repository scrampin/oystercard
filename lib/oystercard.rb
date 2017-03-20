
class Oystercard

  attr_reader :balance, :in_journey

  alias_method :in_journey?, :in_journey

  LIMIT = 90

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

  private
  attr_writer :balance

end

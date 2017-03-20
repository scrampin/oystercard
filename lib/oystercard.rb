
class Oystercard

  attr_reader :balance

  LIMIT = 90

  def initialize
    @balance = 0
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

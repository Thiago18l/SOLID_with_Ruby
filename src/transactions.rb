class Transactions
  attr_accessor :amount, :type, :date
  def initialize  (amount, type, date)
    self.amount = amount
    self.type = type
    self.date = date
  end
  def created_at
    self.date
  end
end
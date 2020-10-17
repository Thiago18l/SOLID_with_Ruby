class Account
  attr_accessor :name, :password, :email
  def initialize (name, password, email)
    self.name = name
    self.password = password
    self.email = email
  end

  def messages (from, to, body)
    self.create(from, to, body)
  end
  private
  def create (from, to, body)
    @from = from
    @to = to
    @body = body
  end
end
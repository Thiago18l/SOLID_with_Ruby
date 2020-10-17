class Account
  attr_accessor :name, :password, :email
  def initialize (name, password, email)
    self.name = name
    self.password = password
    self.email = email
  end

end
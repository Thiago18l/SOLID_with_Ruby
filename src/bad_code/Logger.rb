require '../../src/account'

# Violation of the Open-Closed Principle in Ruby
class Logger
  def initialize (format, delivery)
    @format = format
    @delivery = delivery
  end

  def log(string)
    deliver format(string)
  end

  private
  def format (string)
    case @format
    when :raw
      string
    when :with_date
      "#{Time.now} #{string}"
    when :with_date_and_details
      "Log was create at #{Time.now}, please check details #{string}"
    else
      raise NotImplementedError
    end
  end

  def deliver (text)
    case @delivery
    when :by_email
      Mailer.deliver(
          'emergency@example.com',
          'admin@mail.com',
          'Log report',
          text
      )
    when :by_sms
      client = Account.new("Thiago", "password", "thiago@mail.com")
      client.messages('+55 83 9.81243271', '+55 83 9. 8899-7431', text)
    when :to_stdout
      STDOUT.write(text)
    else
      raise NotImplementedError
    end
  end
end

logger = Logger.new(:raw, :by_sms)
logger.log("Emergency error! Please fix me!")

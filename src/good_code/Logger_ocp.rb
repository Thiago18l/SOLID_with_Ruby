
require '../../src/account'
# Correct use of the Open-Closed Principle in Ruby
class Logger
  def initialize(formatter: DateDetailsFormatter.new, sender: LogWriter.new)
    @formatter = formatter
    @sender = sender
  end

  def log(string)
    @sender.deliver @formatter.format(string)
  end
end

class LogSMS
  def initialize
    @account_sid = "ACCXXXX"
    @auth_token = "auth_token"
    @from = '+55 8395547124'
    @to = '+55 8395547123'
  end

  def deliver (text)
    client.messages(@from, @to, text)
  end
  def client
    @client ||= Account.new("Thiago Lopes", "password", "thiago.lopes@mail.com")
  end
end

class LogMailer
  attr_accessor :from, :to, :subject
  def initialize
    @from = 'emergency@example.com', @to = 'admin@mail.com',
    @subject = 'Logger report'
  end

  def deliver (text)
    Mailer.deliver(from, to, subject, text)
  end
end

class LogWriter
  def deliver(log)
    STDOUT.write(log)
  end
end

class DateFormatter
  def format (string)
    "#{Time.now} #{string}"
  end
end

class DateDetailsFormatter
  def format (string)
    "Log was creates at #{Time.now}, please check details #{string}"
  end
end

class RawFormatter
  def format (string)
    string
  end
end

logger = Logger.new(formatter: RawFormatter.new, sender: LogSMS.new)
puts logger.log("Emergency error! Please fix me!")

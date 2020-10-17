class Mailer
  attr_accessor :from, :to, :subject, :body
  def initialize
  end
  def self.deliver (
      from, to, subject, body
  )
    @from = from
    @to = to
    @subject = subject
    @body = body
    puts "Your email has been send to #{@to}, with subject of #{@subject}
    and the body of email is #{@body}"
  end
end
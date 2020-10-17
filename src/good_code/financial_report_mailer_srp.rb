require '../../src/transactions'
require '../../src/account'
require '../../src/mailer'

class FinancialReportMailerSrp
  def initialize (report, account)
    @report = report
    @account = account
  end
  def deliver
    Mailer.deliver(
        'reporter@example.com', @account.email,
        'Financial Report', @report
    )
  end
end

class FinancialReportGenerator
  def initialize (transactions)
    @transactions = transactions
  end
  def generate
    "Amount: R$#{@transactions.amount} type: #{@transactions.type} date: #{@transactions.created_at}"
  end
end
trans = Transactions.new(6999, "doc", "17/10/2020")
account = Account.new("Thiago Lopes", "password", "myemail@mail.com")
report = FinancialReportGenerator.new(trans).generate
FinancialReportMailerSrp.new(report, account).deliver
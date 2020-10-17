require '../../src/transactions'
require '../../src/account'
require '../../src/mailer'

class FinancialReportMailer
  def initialize (transactions, account)
    @transactions = transactions
    @account = account
    @report = ''
  end
  def generate_report!
    @report = "Amount: #{@transactions.amount} type: #{@transactions.type} date: #{@transactions.created_at}"
  end
  def send_report
    Mailer.deliver(
        'report@example.com',
        @account.email,
        'Your report',
        @report
    )
  end
end
transactions = Transactions.new(2000, "doc", "17/10/2020")
account = Account.new("Thiago", "example0", "thiago.lopes.dev@gmail.com")
mailer = FinancialReportMailer.new(transactions, account)
mailer.generate_report!
mailer.send_report
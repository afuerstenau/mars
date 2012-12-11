class Member < ActiveRecord::Base
  PAYMENT_PERIODS = [ :yearly, :monthly]
  PAYMENT_METHODS = [  :direct_debit, :bank_transfer]
  has_many :children, dependent: :destroy
  has_one :bank_account, dependent: :destroy
  attr_accessible :beitrag, :email, :first_name, :last_name, :phone, :postcode, :street, :town,
  :eintrittsdatum, :austrittsdatum, :payment_period, :payment_method
  attr_reader :full_name
  validates :beitrag, :first_name, :last_name, :postcode, :street, :town, :payment_period, presence: true
  validates :beitrag, numericality: {greater_than: 0}
  validates :postcode, numericality: {greater_than: 0}, numericality: {less_than: 100000}
  validates :postcode, :length => { :is => 5 }
  
  def full_name
    last_name + "," + first_name
  end
  
  def self.to_csv(options = {:col_sep => ";", :force_quotes => true})
    current_date = DateTime.now.strftime("%Y/%m/%d")
    CSV.generate(options) do |csv| 
      csv << ["localBankCode", "localAccountNumber", "localName" \
        ,"remoteBankCode", "remoteAccountNumber", "remoteName" \
        ,"valutaDate", "date", "value_value", "value_currency" \
        ,"transactionKey", , "transactionCode", "transactionText", "purpose", "purpose1"]
      all.each do |member|
        csv << ["20050550", "1259125449", "Grundschule, Schulverein d" \
        , member.bank_account.blz, member.bank_account.account_number, member.full_name \
        , current_date, current_date, member.beitrag.truncate, "EUR" \
        , "MSC", "05", "Lastschrift", "Jahresbeitrag Schulverein 2012/2013", "Vielen Dank!"] 
      end
    end
  end
end

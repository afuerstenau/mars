#encoding: utf-8

class Member < ActiveRecord::Base
  PAYMENT_PERIODS = [ :yearly, :monthly]
  PAYMENT_METHODS = [  :direct_debit, :bank_transfer]
  has_many :children, dependent: :destroy
  has_one :bank_account, dependent: :destroy
  has_many :membership_fees, dependent: :destroy
  attr_accessible :beitrag, :email, :first_name, :last_name, :phone, :postcode, :street, :town,
  :eintrittsdatum, :austrittsdatum, :payment_period, :payment_method
  validates :beitrag, :first_name, :last_name, :postcode, :street, :town, :payment_period, presence: true
  validates :beitrag, numericality: {greater_than: 0}
  validates :postcode, numericality: {greater_than: 0}, numericality: {less_than: 100000}
  validates :postcode, :length => { :is => 5 }

  def full_name
    last_name + "," + first_name
  end

  def self.payments
    Array payment_methods = [nil] + PAYMENT_METHODS.map { |p| [I18n.t(p), p] }
  end

  def payment_for_current_year
    MembershipFee.where(member_id: id, school_year_id: SchoolYear.current_school_year.id)
  end

  def self.to_csv(options = {:col_sep => ";", :force_quotes => true})
    current_date = DateTime.now.strftime("%Y/%m/%d")
    CSV.generate(options) do |csv|
      csv << %w(localBankCode localAccountNumber localName \
        remoteBankCode remoteAccountNumber remoteName \
        valutaDate date value_value value_currency \
        transactionKey transactionCode transactionText purpose purpose1)
      all.each do |member|
        if member.bank_account.nil?
          bank_code = "Kein Konto"
          account_number = "Kein Konto"
        else
          bank_code = member.bank_account.bank_code
          account_number = member.bank_account.account_number
        end
        csv << ["20050550", "1259125449", "Grundschule, Schulverein d" \
        , bank_code, account_number, member.full_name \
        , current_date, current_date, member.beitrag.truncate, "EUR" \
        , "MSC", "05", "Lastschrift", "Jahresbeitrag Schulverein 2012/2013", "Vielen Dank!"]
      end
    end
  end

  def self.to_dtaus
    # Konto des Auftraggebers
    konto_auftraggeber = DTAUS::Konto.new(
      :kontonummer => 1259125449,
      :blz => 20050550,
      :kontoinhaber => 'Schulverein Doehrnstr',
      :bankname =>'HASPA',
      :is_auftraggeber => true
    )
    # LASTSCHRIFT
    # Erstellen eines Datensatzes für eine Lastschrift
    lastschrift = DTAUS::Datensatz.new(:lastschrift, konto_auftraggeber)
    # Rails.logger = Logger.new("/Users/afuerstenau/Projects/mars/log/mylog.log")

    all.each do |member|
      unless member.bank_account.nil?
        kontoinhaber = member.full_name
        kontoinhaber = member.bank_account.account_holder if member.bank_account.account_holder != "s.o."
        konto_kunde = DTAUS::Konto.new(
          :kontonummer => member.bank_account.account_number,
          :blz => member.bank_account.bank_code,
          :kontoinhaber => kontoinhaber,
          :bankname => member.bank_account.bank_name,
          :kundennummer => member.id
        )

        # Lastschrift-Buchung für den Kunden
        buchung = DTAUS::Buchung.new(
          :kunden_konto => konto_kunde,
          :betrag => member.beitrag,
          :transaktionstyp => :lastschrift,
          :verwendungszweck => "Jahresbeitrag Schulverein Döhrnstr. 2012 / 2013. Vielen Dank!"
        )

        lastschrift.add(buchung)
      end
    end
    return lastschrift
  end
end

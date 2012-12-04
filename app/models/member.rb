class Member < ActiveRecord::Base
  PAYMENT_PERIODS = [ "", I18n.t("yearly"), I18n.t("monthly")]
  PAYMENT_METHODS = [ "", I18n.t("direct_debit"), I18n.t("bank_transfer")]
  has_many :children, dependent: :destroy
  has_one :bank_account, dependent: :destroy
  attr_accessible :beitrag, :email, :first_name, :last_name, :phone, :postcode, :street, :town,
  :eintrittsdatum, :austrittsdatum, :payment_period, :payment_method
  validates :beitrag, :first_name, :last_name, :postcode, :street, :town, :payment_period, presence: true
  validates :beitrag, numericality: {greater_than: 0}
  validates :postcode, numericality: {greater_than: 0}, numericality: {less_than: 100000}
  validates :postcode, :length => { :is => 5 }
end

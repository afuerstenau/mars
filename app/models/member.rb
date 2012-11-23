class Member < ActiveRecord::Base
  has_many :children, dependent: :destroy
  has_one :bank_account, dependent: :destroy
  attr_accessible :beitrag, :email, :first_name, :last_name, :phone, :postcode, :street, :town, :eintrittsdatum, :austrittsdatum
  validates :beitrag, :first_name, :last_name, :postcode, :street, :town, presence: true
  validates :beitrag, numericality: {greater_than: 0}
  validates :postcode, numericality: {greater_than: 0}, numericality: {less_than: 100000}
  validates :postcode, :length => { :is => 5 }
end

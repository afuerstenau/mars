class Member < ActiveRecord::Base
  attr_accessible :beitrag, :email, :first_name, :last_name, :phone, :postcode, :street, :town
  validates :beitrag, :first_name, :last_name, :postcode, :street, :town, presence: true
  validates :beitrag, numericality: {greater_than: 0}
  validates :postcode, numericality: {greater_than: 0}, numericality: {less_than: 100000}
end

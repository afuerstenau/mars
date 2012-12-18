class BankAccount < ActiveRecord::Base
  belongs_to :member
  attr_accessible :account_holder, :account_number, :bank_name, :bank_code, :member_id
  validates :bank_code, :length => { :is => 8 }
  validates :account_holder, :account_number, :bank_name, :bank_code, :member_id, presence: true
  validates :bank_code, :numericality => { :only_integer => true }
end

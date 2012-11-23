class BankAccount < ActiveRecord::Base
  belongs_to :member
  attr_accessible :account_holder, :account_number, :bank_name, :blz, :member_id
  validates :blz, :length => { :is => 8 }
  validates :account_holder, :account_number, :bank_name, :blz, :member_id, presence: true
end

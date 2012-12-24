class MembershipFee < ActiveRecord::Base
  belongs_to :member
  belongs_to :school_year
  attr_accessible :fee, :member_id, :payment_date, :payment_method, :school_year_id
end

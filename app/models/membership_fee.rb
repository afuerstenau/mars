class MembershipFee < ActiveRecord::Base
  belongs_to :member
  belongs_to :school_year
  attr_accessible :fee, :member_id, :payment_date, :payment_method, :school_year_id
  validates :fee, :member_id, :payment_date, :payment_method, :school_year_id, presence: true

  def member_name
    Member.find(member_id).full_name
  end

  def school_year
    SchoolYear.find(school_year_id).full_name
  end
end

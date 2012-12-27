class SchoolYear < ActiveRecord::Base
  has_many :membership_fees
  attr_accessible :end_date, :start_date
  
  validates :end_date, :start_date, presence: true

  def full_name
    start_date.year.to_s + "/" + end_date.year.to_s
  end

  def self.current_school_year
    SchoolYear.first(:order => 'end_date DESC')
  end
end

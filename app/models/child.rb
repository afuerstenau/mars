class Child < ActiveRecord::Base
  belongs_to :member
  attr_accessible :first_name, :klasse_bei_eintritt, :last_name, :member_id, :enrolement_date
  attr_reader :enrolement_year
  validates :first_name, :klasse_bei_eintritt, :member_id, :enrolement_date, presence: true
  
  def current_class
    current_last_year = school_year(DateTime.now).last(4)
    enrolement_last_year = enrolement_year.last(4)
    (klasse_bei_eintritt.first.to_i+current_last_year.to_i-enrolement_last_year.to_i).to_s+klasse_bei_eintritt.last
  end
  
  def enrolement_year
    school_year(enrolement_date)
  end
  
  def school_year (selected_date)
    if selected_date.month > 7 then 
        first_year=selected_date.year
      else 
        first_year=selected_date.year-1
      end
    first_year.to_s+"/"+(first_year+1).to_s
  end
end

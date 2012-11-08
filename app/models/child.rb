class Child < ActiveRecord::Base
  belongs_to :member
  attr_accessible :first_name, :klasse_bei_eintritt, :last_name, :member_id
end

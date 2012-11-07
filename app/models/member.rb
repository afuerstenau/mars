class Member < ActiveRecord::Base
  attr_accessible :beitrag, :email, :first_name, :last_name, :phone, :postcode, :street, :town
end

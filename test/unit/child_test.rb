#Encoding: UTF-8
require 'test_helper'

class ChildTest < ActiveSupport::TestCase
 
 
  test "test enrolement year" do
    child = Child.new
    child.first_name= "David"
    child.last_name= "Fürstenau"
    child.klasse_bei_eintritt= "0a"
    child.member_id=1
    child.enrolement_date="2011-08-01"
    assert_equal "2011/2012", child.enrolement_year
    child.enrolement_date="2011-02-01"
    assert_equal "2010/2011", child.enrolement_year
  end
 
  test "child get current class" do
    child = Child.new
    child.first_name= "David"
    child.last_name= "Fürstenau"
    child.klasse_bei_eintritt= "0a"
    child.member_id=1
    child.enrolement_date="2011-08-01"
    assert !child.invalid?
    
    assert_equal "1a", child.current_class
  end
  
  
end

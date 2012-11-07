require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  fixtures :members
  test "member attributes must not be empty" do
    member = Member.new
    assert member.invalid?
    assert member.errors[:first_name].any?
  end
  
  test "beitrag must be positive" do
    member = Member.new(beitrag: -1, first_name: "Alex", last_name: "Fuerstenau", street: "Max-Tau-Str. 9", postcode: "22529", town: "Hamburg")
    assert member.invalid?
    assert_equal ["must be greater than 0"], member.errors[:beitrag]
  end
end

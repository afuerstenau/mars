require 'test_helper'

class MembershipFeesControllerTest < ActionController::TestCase
  setup do
    @membership_fee = membership_fees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membership_fees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membership_fee" do
    assert_difference('MembershipFee.count') do
      post :create, membership_fee: { fee: @membership_fee.fee, member_id: @membership_fee.member_id, payment_date: @membership_fee.payment_date, payment_method: @membership_fee.payment_type, school_year_id: @membership_fee.school_year_id }
    end

    assert_redirected_to membership_fee_path(assigns(:membership_fee))
  end

  test "should show membership_fee" do
    get :show, id: @membership_fee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membership_fee
    assert_response :success
  end

  test "should update membership_fee" do
    put :update, id: @membership_fee, membership_fee: { fee: @membership_fee.fee, member_id: @membership_fee.member_id, payment_date: @membership_fee.payment_date, payment_method: @membership_fee.payment_type, school_year_id: @membership_fee.school_year_id }
    assert_redirected_to membership_fee_path(assigns(:membership_fee))
  end

  test "should destroy membership_fee" do
    assert_difference('MembershipFee.count', -1) do
      delete :destroy, id: @membership_fee
    end

    assert_redirected_to membership_fees_path
  end
end

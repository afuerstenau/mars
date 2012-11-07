require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { beitrag: @member.beitrag, email: @member.email, first_name: @member.first_name, last_name: @member.last_name, phone: @member.phone, postcode: @member.postcode, street: @member.street, town: @member.town }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member, member: { beitrag: @member.beitrag, email: @member.email, first_name: @member.first_name, last_name: @member.last_name, phone: @member.phone, postcode: @member.postcode, street: @member.street, town: @member.town }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end

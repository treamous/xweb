require 'test_helper'

class NewusersControllerTest < ActionController::TestCase
  setup do
    @newuser = newusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newuser" do
    assert_difference('Newuser.count') do
      post :create, :newuser => @newuser.attributes
    end

    assert_redirected_to newuser_path(assigns(:newuser))
  end

  test "should show newuser" do
    get :show, :id => @newuser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @newuser.to_param
    assert_response :success
  end

  test "should update newuser" do
    put :update, :id => @newuser.to_param, :newuser => @newuser.attributes
    assert_redirected_to newuser_path(assigns(:newuser))
  end

  test "should destroy newuser" do
    assert_difference('Newuser.count', -1) do
      delete :destroy, :id => @newuser.to_param
    end

    assert_redirected_to newusers_path
  end
end

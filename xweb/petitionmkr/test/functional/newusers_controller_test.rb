require 'test_helper'

class NewusersControllerTest < ActionController::TestCase
  setup do
    @newuser = newusers(:three)
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


end

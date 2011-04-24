require 'test_helper'

class NewusersControllerTest < ActionController::TestCase
  setup do
    @newuser = users(:three)
    @newuser.password = "user1234"
  end

  #test "should get index" do
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:newusers)
  #end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newuser" do
    #assert_difference('User.count') do
      post :create, :newuser => @newuser
    #end
    #assert_equal @newuser.id, session[:user_id]
  end


end

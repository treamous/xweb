require 'test_helper'

class SpAssociationsControllerTest < ActionController::TestCase
  setup do
    @sp_association = sp_associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sp_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sp_association" do
    assert_difference('SpAssociation.count') do
      post :create, :sp_association => @sp_association.attributes
    end

    assert_redirected_to sp_association_path(assigns(:sp_association))
  end

  test "should show sp_association" do
    get :show, :id => @sp_association.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sp_association.to_param
    assert_response :success
  end

  test "should update sp_association" do
    put :update, :id => @sp_association.to_param, :sp_association => @sp_association.attributes
    assert_redirected_to sp_association_path(assigns(:sp_association))
  end

  test "should destroy sp_association" do
    assert_difference('SpAssociation.count', -1) do
      delete :destroy, :id => @sp_association.to_param
    end

    assert_redirected_to sp_associations_path
  end
end

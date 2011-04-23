require 'test_helper'
require 'admin_controller'

class AdminControllerTest < ActionController::TestCase
  setup do
    @controller = AdminController.new
	@request    = ActionController::TestRequest.new
	@response   = ActionController::TestResponse.new
  end
  
# Replace this with your real tests.
  def test_truth
    assert true
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  if false
    
    def test_index 
      get :index 
      assert_response :success 
    end
    
  end

  
  def test_index_without_user
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end
  

  
  def test_index_with_user
    get :index, {}, { :user_id => users(:three).id }
    assert_response :success
    assert_template "index"
  end
  
 
  
  def test_login
    three = users(:three)
    post :login, :name => three.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal three.id, session[:user_id]
  end
  

  
  def test_bad_password
    three = users(:three)
    post :login, :name => three.name, :password => 'wrong'
    assert_template "login"
    assert_equal "Invalid user/password combination", flash[:notice]
  end



end

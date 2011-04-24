require 'test_helper'

class NewuserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  #test "the truth" do
  #  assert true
  #end
  
  test "create a new user w/o data" do
    user1 = User.new
    assert user1.invalid?
    assert user1.errors[:username].any?
    assert user1.errors[:state].any?
  end
  
  
  test "create a new user with data" do
		user2 = User.new
		user2.username = "tstUser1"
		user2.state = "AK"
		user2.age = "400"
		user2.interest = "None"
		user2.affiliation = "None"
		user2.signature = "tstUser1"
		user2.password = "tstUser1234"
		user2.salt = User.make_salt("tstUser1")
		user2.hashed_password = User.hash_with_salt("tstUser1234", User.make_salt("tstUser1234"))
		user2.email = "tstUser1@example.com"
		user2.first_name = "tstUser1"
		user2.last_name = "NoKeep"
		assert user2.save!
		assert user2.valid?
	end


  test "create a new user with data incomplete" do
		user3 = User.new
		user3.username = "tstUser2"
		user3.state = "WA"
		user3.age = "399"
		user3.interest = "None"
		user3.affiliation = "None"
		user3.signature = "tstUser2"
		user3.password = "tstUser2234"
		user3.salt = User.make_salt("tstUser2")
		user3.hashed_password = User.hash_with_salt("tstUser2234", User.make_salt("tstUser2234"))
		user3.first_name = "tstUser2"
		user3.last_name = "NoKeep"
		assert user3.invalid?
        assert user3.errors[:email].any?
	end 
end

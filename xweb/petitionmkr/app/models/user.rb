require 'digest/sha1'
class User < ActiveRecord::Base

  has_and_belongs_to_many :petitions
  
  attr_accessor :password
  attr_accessor :password_confirmation
  #attr_reader :username
  
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  NAME_REGEX = /^[a-zA-Z ]+$/
  
  #validations galore...    
  validates :first_name, :presence => true, :length => { :maximum => 25 }, :format => {:with => NAME_REGEX, :message => ' should have alphabets only.'}
  validates :last_name, :presence => true, :length => { :maximum => 50 }, :format => {:with => NAME_REGEX, :message => ' should have alphabets only.'}
  validates :username, :presence => true, :length => { :within => 8..25 }, :uniqueness => true
  validates :signature, :presence => true, :length => { :within => 8..25 }
  validates :state, :presence => true , :length => { :maximum => 2 }, :format => {:with => NAME_REGEX, :message => ' should have alphabets only.'}
  validates :age, :presence => true
  validates_numericality_of :age, :integer_only => true, :within => 0..100
  validates :interest, :presence => true , :format => {:with => NAME_REGEX, :message => ' should have alphabets only.'}
  validates :affiliation, :presence => true, :format => {:with => NAME_REGEX, :message => ' should have alphabets only.'}
  validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
  
  #validate  :password_must_be_present
  validates :password, :confirmation => true
  
  # only on create, so other attributes of this user can be changed
  validates_length_of :password, :within => 8..25, :on => :create
  before_save :create_hashed_password
  after_save :clear_password
  

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  
  attr_protected :hashed_password, :salt
  

  
  # Verify user...
  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end
  

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end
  
  # Make a salt string for the DB
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end
  
  # Use a salt to create a hashed password
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  # Get default signature value
  def self.def_sig()
    "username#{Time.now}"
  end
  
  private
  
  # ...
  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = User.make_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  # ...
  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end
  
end

require 'digest/sha2'

class Login < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
 
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password 

  validate  :password_must_be_present
  
  def Login.authenticate(name, password)
    if login = find_by_name(name)
      if login.hashed_password == encrypt_password(password, login.salt)
        login
      end
    end
  end

  def Login.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
  
  # 'password' is a virtual attribute
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end
  
  private

    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end
  
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end

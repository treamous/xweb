class SpAssociation < ActiveRecord::Base
  # Model for the User_Petition Association table	
	
	set_table_name("users_petitions")
	
  # DB serches for managing the Association Table
  #scope :searchSPA, lambda {|u, p| where(["user_id LIKE ? AND petition_id LIKE ?", u,p])}
  scope :searchSPA, lambda {|u,p| where(:user_id => u, :petition_id => p)}

   #set_table_name 'users_petitions'
  	
  	
  # Add to User/Petition Association Table
  def self.spatbladd(user_id="", petition_id="")
  	spa = SpAssociation.new
  	spa.user_id = user_id
  	spa.petition_id = petition_id
  	if spa.save!
  		return true
  	else
  		return false
  	end
  end
  
  # Remove from User/Petition Association Table
  def self.spatblrmv(user_id="", petition_id="")
  	#spa = searchSPA(user_id, petition_id)
  	spa = SpAssociation.new
  	spa.user_id = user_id
  	spa.petition_id = petition_id
	if spa.destroy
	  	return true
  	else
  		return false
  	end

  end 
  
  # Return true if there is an association between user and petition
  def self.spatblbool(user_id="", petition_id="")
  	spa = searchSPA(user_id, petition_id)

    if spa.length > 0
      return true
    else
      return false
    end
	
  end 
  
  
end

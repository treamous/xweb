# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#User.create(:username => "admin123", :state => "FL",:age => "98", :interest => "None", :affiliation => "None", :password => "admin123", :signature => "admin123", :salt => User.make_salt("admin123"), :hashed_password => User.hash_with_salt("admin123", User.make_salt("admin123")), :email => "admin123@example.com", :first_name => "admin123", :last_name => "NoName")
#User.create(:state => "AZ",:age => "1", :interest => "None", :affiliation => "None", :password => "mjca1234", :username => "mjca1234",  :signature => "mjca1234", :salt => User.make_salt("mjca1234"), :hashed_password => User.hash_with_salt("mjca1234", User.make_salt("mjca1234")), :email => "mjca1234@example.com", :first_name => "mjca1234", :last_name => "NoName")

User.create(
            :state => 'AZ',
            :age => '1', 
            :interest => 'None', 
            :affiliation => 'None', 
            :password => 'mjca1234', 
            :username => 'mjca1234',  
            :signature => 'mjca1234', 
            :salt => User.make_salt('mjca1234'), 
            :hashed_password => User.hash_with_salt('mjca1234', User.make_salt('mjca1234')), 
            :email => 'mjca1234@example.com', 
            :first_name => 'mjca1234', 
            :last_name => 'NoName')


user = User.new
user.username = "admin123"
user.state = "FL"
user.age = "98"
user.interest = "None"
user.affiliation = "None"
user.password = "admin123"
user.signature = "admin123"
user.salt = User.make_salt("admin123")
user.hashed_password = User.hash_with_salt("admin123", User.make_salt("admin123"))
user.email = "admin123@example.com"
user.first_name = "admin123"
user.last_name = "NoName"
user.save!

pet1 = Petition.new
pet1.title = "open"
pet1.description = "any signature required"
pet1.criteria = "AZ"
pet1.username = "admin123"
Time.zone = "Mountain Time (US & Canada)"
pet1.closedate = Time.zone.now + 20.hours
pet1.save!

pet2 = Petition.new
pet2.title = "mjca's petition"
pet2.description = "all mjca"
pet2.criteria = "CA"
pet2.username = "mjca"
Time.zone = "Mountain Time (US & Canada)"
pet2.closedate = Time.zone.now + 24.hours
pet2.save!
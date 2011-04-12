# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:state => "MI",:age => "98", :interest => "None", :affiliation => "None", :password => "admin123", :username => "admin123", :signature => "admin123", :salt => User.make_salt("admin123"), :hashed_password => User.hash_with_salt("admin123", User.make_salt("admin123")), :email => "admin123@example.com", :first_name => "admin123", :last_name => "NoName")
User.create(:state => "AZ",:age => "1", :interest => "None", :affiliation => "None", :password => "mjca1234", :username => "mjca1234",  :signature => "mjca1234", :salt => User.make_salt("mjca1234"), :hashed_password => User.hash_with_salt("mjca1234", User.make_salt("mjca1234")), :email => "mjca1234@example.com", :first_name => "mjca1234", :last_name => "NoName")
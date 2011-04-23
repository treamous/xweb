require 'test_helper'

class PetitionTest < ActiveSupport::TestCase
	# Replace this with your real tests.
	test "the truth" do
		assert true
	end

	test "create a new petition w/o data" do
		pet1 = Petition.new
		assert pet1.invalid?
		assert pet1.errors[:all].any?
	end

	test "create a new petition with data" do
		pet2 = Petition.new
	    Time.zone = "Mountain Time (US & Canada)"		
		pet2.title = "Open: " + Time.zone.now.to_s()
		pet2.description = "any signature required"
		pet2.criteria = "AZ"
		pet2.username = "admin123"
		pet2.closedate = Time.zone.now + 20.hours
		pet2.save!
		assert pet2.valid?
		assert pet2.errors[:all].any?
	end

	test "create a new petition with data incomplete" do
		pet3 = Petition.new
		Time.zone = "Mountain Time (US & Canada)"		
		pet3.title = "Open: " + Time.zone.now.to_s()
		pet3.description = "any signature required"
		pet3.criteria = "AZ"
		pet3.username = "admin123"
		Time.zone = "Mountain Time (US & Canada)"
		pet3.closedate = Time.zone.now + 20.hours
		pet3.save!
		assert pet3.valid?
		assert pet3.errors[:all].any?
	end

end

class AlterPetitionForUsername < ActiveRecord::Migration
  def self.up
    add_column("petitions", "username", :string, :within => 8..25)
    add_index("petitions", "username")
    add_column("petitions", "closedate", :datetime)
  end

  def self.down
    remove_column("petitions", "closedate")
    remove_index("petitions", "username")
    remove_column("petitions", "username")
  end
end

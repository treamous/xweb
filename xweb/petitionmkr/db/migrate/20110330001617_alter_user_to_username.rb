class AlterUserToUsername < ActiveRecord::Migration
  def self.up
    add_column("users", "username", :string, :within => 8..25)
  end

  def self.down
    remove_column("users", "username")
  end
end

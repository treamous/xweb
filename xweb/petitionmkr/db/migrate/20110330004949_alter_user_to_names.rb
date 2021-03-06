class AlterUserToNames < ActiveRecord::Migration
  def self.up
    add_column("users", "first_name", :string, :limit => 40, :default => "")
    add_column("users", "last_name", :string, :limit => 40, :default => "")
    add_index("users", "username")
  end

  def self.down
    remove_index("users", "username")
    remove_column("users", "last_name", :string, :limit => 40, :default => "")
    remove_column("users", "first_name", :string, :limit => 40, :default => "")
  end
end

class AlterUsers < ActiveRecord::Migration
  def self.up
    add_column("users", "email", :string, :limit => 40, :default => "")
    change_column("users", "salt", :string, :limit => 40)
    add_index("users", "name")
  end

  def self.down
    remove_index("users", "name")
    change_column("users", "salt", :string)
    remove_column("users", "email")
  end
end

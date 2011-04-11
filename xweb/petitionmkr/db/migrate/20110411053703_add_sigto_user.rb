class AddSigtoUser < ActiveRecord::Migration
  def self.up
    add_column("users", "signature", :string, :within => 8..25)
    add_index("users", "signature")
  end

  def self.down
  	remove_index("users", "signature")
    remove_column("users", "signature")
  end
end

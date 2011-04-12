class ChangeSignUser < ActiveRecord::Migration
  def self.up
    #change_column("users", "signature", :string, :default => :username)
  end

  def self.down
    #change_column_default("users", "signature", nil)
  end
end

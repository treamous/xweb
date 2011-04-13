class Removeindexfromuser < ActiveRecord::Migration
  def self.up
    remove_index("users", "signature")
  end

  def self.down
    add_index("users", "signature")
  end
end

class AddIndexToAssocTable < ActiveRecord::Migration
  def self.up
  	add_column :users_petitions, :id, :primary_key
  end

  def self.down
  	remove_column :users_petitions, :id
  end
end

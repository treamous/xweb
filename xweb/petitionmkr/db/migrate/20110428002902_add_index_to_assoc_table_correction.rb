class AddIndexToAssocTableCorrection < ActiveRecord::Migration
  def self.up
  	drop_table :users_petitions
  	
  	create_table :users_petitions do |t|
      t.integer :user_id
      t.integer :petition_id
      
      t.timestamps
    end
    
    add_index :users_petitions, [:petition_id, :user_id] 
    add_index :users_petitions, :user_id
  end

  def self.down
  	drop_table :users_petitions
  end
end

class CreateSpAssociations < ActiveRecord::Migration
  def self.up
    create_table :users_petitions, :id => false do |t|
      t.integer :user_id
      t.integer :petition_id
    end
    
    add_index :users_petitions, [:petition_id, :user_id] 
    add_index :users_petitions, :user_id

  end
  
  

  def self.down
    drop_table :users_petitions
  end
end

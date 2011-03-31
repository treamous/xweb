class CreatePetitions < ActiveRecord::Migration
  def self.up
    create_table :petitions do |t|
      t.string :title, :limit => 100, :null => false
      t.text :description, :null => false
      t.string :criteria, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :petitions
  end
end

class CreatePetitions < ActiveRecord::Migration
  def self.up
    create_table :petitions do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :criteria, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :petitions
  end
end

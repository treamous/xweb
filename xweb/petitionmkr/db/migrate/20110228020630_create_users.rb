class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 50
      t.string :state, :limit => 2
      t.integer :age, :limit => 3
      t.text :interest
      t.text :affiliation
      t.string :hashed_password, :limit => 40
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

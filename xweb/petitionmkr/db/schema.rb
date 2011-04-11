# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110411072242) do

  create_table "petitions", :force => true do |t|
    t.string   "title",       :limit => 100, :null => false
    t.text     "description",                :null => false
    t.string   "criteria",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.datetime "closedate"
  end

  add_index "petitions", ["username"], :name => "index_petitions_on_username"

  create_table "users", :force => true do |t|
    t.string   "state",           :limit => 2
    t.integer  "age",             :limit => 3
    t.text     "interest"
    t.text     "affiliation"
    t.string   "hashed_password", :limit => 40
    t.string   "salt",            :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           :limit => 40, :default => ""
    t.string   "username"
    t.string   "first_name",      :limit => 40, :default => ""
    t.string   "last_name",       :limit => 40, :default => ""
    t.string   "signature",                     :default => "username"
  end

  add_index "users", ["signature"], :name => "index_users_on_signature"
  add_index "users", ["username"], :name => "index_users_on_username"

end

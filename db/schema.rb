# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140223052357) do

  create_table "group_memberships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_memberships", ["user_id", "group_id"], :name => "index_group_memberships_on_user_id_and_group_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "founder_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "meeting_guests", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "meeting_id", :null => false
    t.string   "status",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "meeting_guests", ["user_id", "meeting_id"], :name => "index_meeting_guests_on_user_id_and_meeting_id", :unique => true

  create_table "meetings", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "description",  :null => false
    t.string   "location"
    t.integer  "organizer_id", :null => false
    t.integer  "group_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "meetings", ["group_id"], :name => "index_meetings_on_group_id"
  add_index "meetings", ["organizer_id"], :name => "index_meetings_on_organizer_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 15,  :null => false
    t.string   "full_name",                      :null => false
    t.string   "bio",             :limit => 500
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "location"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "password_digest",                :null => false
    t.string   "session_token",                  :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end

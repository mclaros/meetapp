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

ActiveRecord::Schema.define(:version => 20140319042959) do

  create_table "comments", :force => true do |t|
    t.integer  "author_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "updated",          :default => false, :null => false
    t.string   "content",                             :null => false
  end

  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"

  create_table "group_memberships", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "group_id",                    :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "join_comment", :limit => 200
  end

  add_index "group_memberships", ["user_id", "group_id"], :name => "index_group_memberships_on_user_id_and_group_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "name",                                            :null => false
    t.string   "description",                                     :null => false
    t.integer  "founder_id",                                      :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "demonym",     :limit => 10, :default => "member", :null => false
    t.string   "tags"
  end

  add_index "groups", ["founder_id"], :name => "index_groups_on_founder_id"

  create_table "meeting_guests", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "meeting_id", :null => false
    t.string   "status",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "meeting_guests", ["user_id", "meeting_id"], :name => "index_meeting_guests_on_user_id_and_meeting_id", :unique => true

  create_table "meetings", :force => true do |t|
    t.string   "name",                                                                             :null => false
    t.string   "description",                                                                      :null => false
    t.string   "location",                :limit => 200,                                           :null => false
    t.integer  "organizer_id",                                                                     :null => false
    t.integer  "group_id"
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
    t.date     "start_date",                                                                       :null => false
    t.time     "start_time",                                                                       :null => false
    t.date     "end_date"
    t.time     "end_time"
    t.float    "suggested_donation"
    t.boolean  "is_past",                                :default => false,                        :null => false
    t.string   "time_zone",                              :default => "Pacific Time (US & Canada)", :null => false
    t.string   "additional_instructions", :limit => 200
    t.boolean  "is_private",                             :default => false,                        :null => false
  end

  add_index "meetings", ["group_id"], :name => "index_meetings_on_group_id"
  add_index "meetings", ["organizer_id"], :name => "index_meetings_on_organizer_id"
  add_index "meetings", ["start_date", "start_time"], :name => "index_meetings_on_start_date_and_start_time"

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 15,  :null => false
    t.string   "full_name",                      :null => false
    t.string   "bio",             :limit => 500
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

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

ActiveRecord::Schema.define(:version => 20111222094222) do

  create_table "assertations", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "objekt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assertations", ["objekt_id"], :name => "index_assertations_on_objekt_id"
  add_index "assertations", ["subject_id"], :name => "index_assertations_on_subject_id"

  create_table "cancels", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "objekt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cancels", ["objekt_id"], :name => "index_cancels_on_objekt_id"
  add_index "cancels", ["subject_id"], :name => "index_cancels_on_subject_id"

  create_table "changes", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "objekt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "changes", ["objekt_id"], :name => "index_changes_on_objekt_id"
  add_index "changes", ["subject_id"], :name => "index_changes_on_subject_id"

  create_table "papers", :force => true do |t|
    t.string   "kind"
    t.string   "authority"
    t.text     "title"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.date     "approved_on"
    t.string   "type"
    t.string   "state"
    t.string   "file_url"
    t.date     "deflected_on"
  end

end

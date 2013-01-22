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

ActiveRecord::Schema.define(:version => 20130118091242) do

  create_table "assertations", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "objekt_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assertations", ["objekt_id"], :name => "index_assertations_on_objekt_id"
  add_index "assertations", ["subject_id"], :name => "index_assertations_on_subject_id"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "cancels", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "objekt_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cancels", ["objekt_id"], :name => "index_cancels_on_objekt_id"
  add_index "cancels", ["subject_id"], :name => "index_cancels_on_subject_id"

  create_table "categories", :force => true do |t|
    t.integer  "context_id"
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["context_id"], :name => "index_categories_on_context_id"

  create_table "categories_papers", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "paper_id"
  end

  add_index "categories_papers", ["category_id"], :name => "index_categories_papers_on_category_id"
  add_index "categories_papers", ["paper_id"], :name => "index_categories_papers_on_paper_id"

  create_table "changes", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "objekt_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "changes", ["objekt_id"], :name => "index_changes_on_objekt_id"
  add_index "changes", ["subject_id"], :name => "index_changes_on_subject_id"

  create_table "contexts", :force => true do |t|
    t.string   "title"
    t.string   "ancestry"
    t.string   "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contexts", ["ancestry"], :name => "index_contexts_on_ancestry"
  add_index "contexts", ["weight"], :name => "index_contexts_on_weight"

  create_table "papers", :force => true do |t|
    t.string   "kind"
    t.string   "authority"
    t.text     "title"
    t.date     "published_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "number"
    t.date     "approved_on"
    t.string   "type"
    t.string   "state"
    t.date     "deflected_on"
    t.text     "file_url"
    t.integer  "context_id"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "context_id"
    t.string   "context_type"
    t.string   "role"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "permissions", ["user_id", "role", "context_id", "context_type"], :name => "by_user_and_role_and_context"

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.text     "name"
    t.text     "email"
    t.text     "nickname"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "location"
    t.text     "description"
    t.text     "image"
    t.text     "phone"
    t.text     "urls"
    t.text     "raw_info"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["uid"], :name => "index_users_on_uid"

end

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140829183253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "phase"
    t.integer  "step"
    t.string   "activity_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agencies", force: true do |t|
    t.integer  "lead_id"
    t.integer  "facilitator_id"
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "status",         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agencies", ["lead_id"], name: "index_agencies_on_lead_id", using: :btree

  create_table "agency_users", force: true do |t|
    t.integer  "agency_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agency_users", ["agency_id", "user_id"], name: "index_agency_users_on_agency_id_and_user_id", using: :btree
  add_index "agency_users", ["agency_id"], name: "index_agency_users_on_agency_id", using: :btree
  add_index "agency_users", ["user_id"], name: "index_agency_users_on_user_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.string   "ip"
    t.string   "contact_type"
    t.string   "http_referrer"
    t.string   "status",        default: "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "from_id"
    t.integer  "agency_id"
    t.integer  "parent_obj_id"
    t.string   "parent_obj_type"
    t.string   "context"
    t.string   "subject"
    t.text     "content"
    t.integer  "status",          default: 0
    t.boolean  "read",            default: false
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["agency_id"], name: "index_messages_on_agency_id", using: :btree
  add_index "messages", ["from_id"], name: "index_messages_on_from_id", using: :btree
  add_index "messages", ["parent_obj_id", "parent_obj_type"], name: "index_messages_on_parent_obj_id_and_parent_obj_type", using: :btree

  create_table "prompts", force: true do |t|
    t.integer  "question_id"
    t.string   "prompt_type", default: "radio"
    t.text     "content"
    t.integer  "value"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "activity_id"
    t.string   "name"
    t.text     "content"
    t.string   "question_type"
    t.integer  "seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["activity_id"], name: "index_questions_on_activity_id", using: :btree
  add_index "questions", ["name"], name: "index_questions_on_name", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "user_id"
    t.integer  "agency_id"
    t.integer  "question_id"
    t.integer  "prompt_id"
    t.text     "content"
    t.datetime "started_at"
    t.datetime "responded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["agency_id"], name: "index_responses_on_agency_id", using: :btree
  add_index "responses", ["prompt_id"], name: "index_responses_on_prompt_id", using: :btree
  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "user_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "agency_id"
    t.string   "parent_obj"
    t.string   "name"
    t.text     "content"
    t.integer  "value"
    t.string   "http_referrer"
    t.string   "req_path"
    t.integer  "status",        default: 1
    t.datetime "publish_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_events", ["agency_id"], name: "index_user_events_on_agency_id", using: :btree
  add_index "user_events", ["name", "user_id"], name: "index_user_events_on_name_and_user_id", using: :btree
  add_index "user_events", ["name"], name: "index_user_events_on_name", using: :btree
  add_index "user_events", ["parent_obj"], name: "index_user_events_on_parent_obj", using: :btree
  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role",                   default: 0
    t.string   "avatar"
    t.datetime "dob"
    t.string   "gender"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "status",                 default: "1"
    t.string   "website_url"
    t.text     "bio"
    t.text     "sig"
    t.string   "ip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "password_hint"
    t.string   "password_hint_response"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end

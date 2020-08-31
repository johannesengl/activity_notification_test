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

ActiveRecord::Schema.define(version: 20200831111906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "target_id",       null: false
    t.string   "target_type",     null: false
    t.integer  "notifiable_id",   null: false
    t.string   "notifiable_type", null: false
    t.string   "key",             null: false
    t.integer  "group_id"
    t.string   "group_type"
    t.integer  "group_owner_id"
    t.integer  "notifier_id"
    t.string   "notifier_type"
    t.text     "parameters"
    t.datetime "opened_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "notifications", ["group_owner_id"], name: "index_notifications_on_group_owner_id", using: :btree
  add_index "notifications", ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id", using: :btree
  add_index "notifications", ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
  add_index "notifications", ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id", using: :btree
  add_index "notifications", ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "target_id",                               null: false
    t.string   "target_type",                             null: false
    t.string   "key",                                     null: false
    t.boolean  "subscribing",              default: true, null: false
    t.boolean  "subscribing_to_email",     default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text     "optional_targets"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "subscriptions", ["key"], name: "index_subscriptions_on_key", using: :btree
  add_index "subscriptions", ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true, using: :btree
  add_index "subscriptions", ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

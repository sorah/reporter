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

ActiveRecord::Schema.define(version: 20160329103556) do

  create_table "channels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "receiver_name"
    t.text     "params",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "incident_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "incidents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "state"
    t.text     "summary",     limit: 65535
    t.datetime "happened_at"
    t.datetime "resolved_at"
    t.text     "meta",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "type_id"
    t.integer  "level"
  end

  create_table "updates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "incident_id"
    t.text     "change",      limit: 65535
    t.text     "comment",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "actions",     limit: 65535
  end

end

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

ActiveRecord::Schema.define(:version => 20130311085007) do

  create_table "adminlists", :force => true do |t|
    t.string "username"
    t.string "password"
  end

  create_table "bookdbs", :force => true do |t|
    t.integer "barcode"
    t.string  "name"
    t.string  "callnum"
  end

  create_table "borrowreturns", :force => true do |t|
    t.integer  "studentid"
    t.string   "bookname"
    t.datetime "borrowdate"
    t.datetime "duedate"
    t.string   "bookid"
    t.integer  "barcode"
    t.float    "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "changeprices", :force => true do |t|
    t.string  "type"
    t.integer "checkoutdate"
    t.float   "price"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "userlists", :force => true do |t|
    t.integer "stucolid"
    t.string  "name"
    t.string  "surname"
    t.integer "status"
  end

end

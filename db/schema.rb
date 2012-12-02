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

ActiveRecord::Schema.define(:version => 20121202200104) do

  create_table "bank_accounts", :force => true do |t|
    t.integer  "member_id"
    t.integer  "blz",            :limit => 8
    t.integer  "account_number"
    t.string   "bank_name"
    t.string   "account_holder"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "children", :force => true do |t|
    t.integer  "member_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "klasse_bei_eintritt"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.date     "enrolement_date"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "street"
    t.integer  "postcode"
    t.decimal  "beitrag",        :precision => 8, :scale => 2
    t.string   "town"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.date     "eintrittsdatum"
    t.date     "austrittsdatum"
    t.string   "payment_period"
  end

end

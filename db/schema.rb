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

ActiveRecord::Schema.define(version: 20190424115331) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",              limit: 30
    t.string   "email",             limit: 50
    t.string   "password_digest"
    t.string   "company_name",      limit: 30
    t.string   "representative",    limit: 30
    t.bigint   "capital"
    t.bigint   "sales"
    t.bigint   "employee"
    t.string   "url"
    t.string   "country",           limit: 10
    t.integer  "zip"
    t.string   "state",             limit: 10
    t.string   "city",              limit: 10
    t.string   "other_address",     limit: 50
    t.bigint   "phone_num"
    t.string   "business_content"
    t.string   "main_item"
    t.text     "appeal_point",      limit: 65535
    t.decimal  "evaluation",                      precision: 1, scale: 1
    t.boolean  "credit_check_flag"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "explanation"
    t.integer  "price"
    t.string   "amount_unit", limit: 3
    t.integer  "minimum_lot"
    t.text     "unit",        limit: 65535
    t.binary   "pics",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["company_id"], name: "index_items_on_company_id", using: :btree
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.integer  "item_id"
    t.bigint   "quantity"
    t.bigint   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_purchases_on_company_id", using: :btree
    t.index ["item_id"], name: "index_purchases_on_item_id", using: :btree
  end

  add_foreign_key "items", "companies"
  add_foreign_key "purchases", "companies"
  add_foreign_key "purchases", "items"
end

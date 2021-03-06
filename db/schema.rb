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

ActiveRecord::Schema.define(version: 20150902022445) do

  create_table "event_facebook_pages", force: :cascade do |t|
    t.integer  "evnt_id"
    t.integer  "facebook_page_id"
    t.datetime "created_dt"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "lnk_evnt_id"
    t.integer  "lnk_evnt_status_id"
    t.integer  "org_id"
    t.datetime "created_dt"
    t.datetime "modified_dt"
    t.integer  "created_by_user_id"
    t.integer  "modified_by_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "org_src_id"
    t.integer  "org_id"
    t.integer  "account_type_id"
    t.datetime "created_dt"
    t.datetime "modified_dt"
    t.integer  "created_by_user_id"
    t.integer  "modified_by_user_id"
    t.boolean  "target_marketer_bit"
    t.integer  "target_marketer_subscription_pricing_id"
    t.integer  "target_marketer_billing_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "aus_id"
    t.string   "refresh_token"
    t.datetime "created_dt"
    t.datetime "modified_dt"
    t.boolean  "admin"
    t.string   "ent_prsn_id"
  end

  create_table "facebook_pages", force: :cascade do |t|
    t.string   "facebook_page_id"
    t.string   "access_token"
    t.datetime "created_dt"
  end

  create_table "organization_contracts", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "contract_id"
    t.integer  "signed_by_user_id"
    t.datetime "signed_dt"
    t.datetime "created_dt"
    t.datetime "modified_dt"
  end

end

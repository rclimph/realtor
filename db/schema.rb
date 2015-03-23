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

ActiveRecord::Schema.define(version: 20150202102636) do

  create_table "addresses", force: true do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "region"
    t.string   "zip"
    t.string   "country"
    t.integer  "addressable_id",   null: false
    t.string   "addressable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: true do |t|
    t.string   "name"
    t.string   "building_type"
    t.boolean  "address_same_as_development"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "zip"
    t.string   "country"
    t.integer  "lowest_floor"
    t.integer  "highest_floor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "development_area_id"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "corporate_tenants", force: true do |t|
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "province"
    t.string   "company_country"
    t.string   "zip"
    t.string   "business_type"
    t.string   "representative_position"
    t.string   "representative_last_name"
    t.string   "representative_middle_name"
    t.string   "representative_first_name"
    t.string   "representative_salutation"
    t.string   "representative_country_citizenship"
    t.string   "representative_address_1"
    t.string   "representative_address_2"
    t.string   "representative_city"
    t.string   "representative_province"
    t.string   "representative_country"
    t.string   "representative_zip"
    t.string   "id_type_1"
    t.string   "id_number_1"
    t.date     "id_issued_1"
    t.date     "id_expiry_1"
    t.string   "issue_place_1"
    t.string   "id_type_2"
    t.string   "id_number_2"
    t.date     "id_issued_2"
    t.date     "id_expiry_2"
    t.string   "issue_place_2"
    t.string   "id_type_3"
    t.string   "id_number_3"
    t.date     "id_issued_3"
    t.date     "id_expiry_3"
    t.string   "issue_place_3"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "development_areas", force: true do |t|
    t.string   "name"
    t.decimal  "area",              precision: 8,  scale: 2
    t.decimal  "valuation",         precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_owner_id"
  end

  create_table "master_contracts", force: true do |t|
    t.string   "contract_name"
    t.string   "contract_label"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_owners", force: true do |t|
    t.string   "company_name"
    t.string   "email"
    t.string   "contact_number"
    t.string   "representative_name"
    t.string   "representative_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "unit_template_pricings", force: true do |t|
    t.string   "price_type"
    t.decimal  "pricepersqm",      precision: 10, scale: 0
    t.decimal  "priceperunit",     precision: 10, scale: 0
    t.integer  "unit_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_templates", force: true do |t|
    t.string   "name"
    t.string   "unit_type"
    t.boolean  "furnished"
    t.decimal  "area",        precision: 10, scale: 0
    t.decimal  "sqmprice",    precision: 10, scale: 0
    t.decimal  "unitprice",   precision: 10, scale: 0
    t.boolean  "has_merged",                           default: false
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "unit_templates", ["parent_id"], name: "index_unit_templates_on_parent_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end

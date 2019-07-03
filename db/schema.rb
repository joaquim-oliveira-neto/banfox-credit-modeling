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

ActiveRecord::Schema.define(version: 2019_07_01_180056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_reports", force: :cascade do |t|
    t.string "cnpj"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "evidences", force: :cascade do |t|
    t.jsonb "input_data"
    t.jsonb "collected_data"
    t.string "referee_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_data", force: :cascade do |t|
    t.string "source"
    t.jsonb "raw_data"
    t.bigint "key_indicator_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "query"
    t.datetime "ttl"
    t.index ["key_indicator_report_id"], name: "index_external_data_on_key_indicator_report_id"
  end

  create_table "key_indicator_reports", force: :cascade do |t|
    t.jsonb "input_data"
    t.string "pipeline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "key_indicators", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "description"
    t.integer "flag"
    t.integer "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "params"
  end

  create_table "report_requests", force: :cascade do |t|
    t.string "cnpj"
    t.bigint "user_id"
    t.bigint "company_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_report_id"], name: "index_report_requests_on_company_report_id"
    t.index ["user_id"], name: "index_report_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "external_data", "key_indicator_reports"
  add_foreign_key "report_requests", "company_reports"
  add_foreign_key "report_requests", "users"
end

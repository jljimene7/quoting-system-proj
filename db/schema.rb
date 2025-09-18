# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_18_024400) do
  create_table "components", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "unit_price_vendor"
    t.decimal "unit_price_internal"
    t.text "customizable_attributes"
    t.integer "vendor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_components_on_vendor_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "contact_email"
    t.string "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricing_sheets", force: :cascade do |t|
    t.string "price_type"
    t.decimal "price"
    t.date "effective_date"
    t.integer "component_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_pricing_sheets_on_component_id"
  end

  create_table "quote_components", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price_at_quote_time"
    t.text "customizations"
    t.integer "quote_id", null: false
    t.integer "component_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_quote_components_on_component_id"
    t.index ["quote_id"], name: "index_quote_components_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "status"
    t.text "problem_statement"
    t.text "specifications"
    t.text "machine_configuration"
    t.decimal "margin_percentage"
    t.decimal "margin_amount"
    t.decimal "total_price"
    t.integer "user_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "components", "vendors"
  add_foreign_key "pricing_sheets", "components"
  add_foreign_key "quote_components", "components"
  add_foreign_key "quote_components", "quotes"
  add_foreign_key "quotes", "customers"
  add_foreign_key "quotes", "users"
end

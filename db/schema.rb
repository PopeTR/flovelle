# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_03_134643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flower_subscriptions", force: :cascade do |t|
    t.string "size"
    t.integer "frequency"
    t.string "preferences"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "delivery_date"
    t.string "delivery_day"
    t.string "time_of_day"
    t.integer "price_cents", default: 0, null: false
    t.string "state"
    t.string "flower_subscription_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.index ["user_id"], name: "index_flower_subscriptions_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "supplier_id", null: false
    t.bigint "flower_subscription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flower_subscription_id"], name: "index_orders_on_flower_subscription_id"
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "zipcode"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.string "address"
    t.string "zipcode"
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "flower_subscriptions", "users"
  add_foreign_key "orders", "flower_subscriptions"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "suppliers", "users"
end

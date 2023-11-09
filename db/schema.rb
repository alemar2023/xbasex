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

ActiveRecord::Schema[7.1].define(version: 2023_11_07_115234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blueprint_translations", force: :cascade do |t|
    t.bigint "blueprint_id", null: false
    t.string "name", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_blueprint_translations_on_blueprint_id"
    t.index ["locale", "blueprint_id"], name: "index_blueprint_translations_on_locale_and_blueprint_id", unique: true
    t.index ["locale"], name: "index_blueprint_translations_on_locale"
    t.index ["name"], name: "index_blueprint_translations_on_name"
  end

  create_table "blueprint_values", force: :cascade do |t|
    t.bigint "blueprint_id", null: false
    t.bigint "property_id", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blueprint_id"], name: "index_blueprint_values_on_blueprint_id"
    t.index ["property_id"], name: "index_blueprint_values_on_property_id"
  end

  create_table "blueprints", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "expansion_id"
    t.index ["brand_id"], name: "index_blueprints_on_brand_id"
    t.index ["category_id"], name: "index_blueprints_on_category_id"
    t.index ["expansion_id"], name: "index_blueprints_on_expansion_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "expansions", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_expansions_on_brand_id"
    t.index ["name", "brand_id"], name: "index_expansions_on_name_and_brand_id", unique: true
    t.index ["name"], name: "index_expansions_on_name"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_properties_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "role", default: "user", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blueprint_translations", "blueprints"
  add_foreign_key "blueprint_values", "blueprints"
  add_foreign_key "blueprint_values", "properties"
  add_foreign_key "blueprints", "brands"
  add_foreign_key "blueprints", "categories"
  add_foreign_key "blueprints", "expansions"
  add_foreign_key "expansions", "brands"
end

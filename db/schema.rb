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

ActiveRecord::Schema.define(version: 20170709084143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "delivery_charges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount_in_cents", default: 0
    t.int4range "price_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_range"], name: "index_delivery_charges_on_price_range", using: :gist
    t.index ["price_range"], name: "no_price_range_overlap", using: :gist
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "price_in_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

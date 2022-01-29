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

ActiveRecord::Schema.define(version: 2022_01_28_192247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_rental_requests", force: :cascade do |t|
    t.integer "car_id", null: false
    t.date "end_date", null: false
    t.date "start_date", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_rental_requests_on_car_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name", null: false
    t.integer "year", null: false
    t.integer "mpg", null: false
    t.integer "doors", null: false
    t.string "gas", null: false
    t.integer "seats", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

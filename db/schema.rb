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

ActiveRecord::Schema[7.0].define(version: 2022_06_09_012517) do
  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "volume"
    t.integer "price"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "units", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units_courses", id: false, force: :cascade do |t|
    t.integer "unit_id", null: false
    t.integer "course_id", null: false
   # t.integer "units_id"
   # t.integer "courses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    # t.index ["courses_id"], name: "index_units_courses_on_courses_id"
    # t.index ["units_id"], name: "index_units_courses_on_units_id"
  end

end

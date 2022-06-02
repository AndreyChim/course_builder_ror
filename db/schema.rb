ActiveRecord::Schema[7.0].define(version: 2022_05_25_135359) do
  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "volume"
    t.integer "price"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "units_id"
    t.integer "courses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_id"], name: "index_units_courses_on_courses_id"
    t.index ["units_id"], name: "index_units_courses_on_units_id"
  end

end

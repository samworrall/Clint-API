ActiveRecord::Schema.define(version: 2018_06_26_155832) do

  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities_events", force: :cascade do |t|
    t.bigint "availability_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_availabilities_events_on_availability_id"
    t.index ["event_id"], name: "index_availabilities_events_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availabilities_events", "availabilities"
  add_foreign_key "availabilities_events", "events"
end

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

ActiveRecord::Schema.define(version: 2020_11_12_160013) do

  create_table "digits", primary_key: "digit", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


  create_view "ninety_nine_sequences", sql_definition: <<-SQL
      SELECT (d1.digit + (d2.digit * 10)) AS number FROM (digits d1 join digits d2) ORDER BY number asc
  SQL
  create_view "monthly_registered_users", sql_definition: <<-SQL
      SELECT
      Date('now', 'LocalTime', 'start of month', '+' || nns.number || ' Day') as registered_on,
      IFNULL(COUNT(u.id),0) as users_count
  FROM ninety_nine_sequences as nns
  LEFT JOIN users as u ON Date('now', 'LocalTime', 'start of month', '+' || nns.number || ' Day') = Date(u.created_at, 'LocalTime')
  WHERE Date('now', 'LocalTime', 'start of month', '+' || nns.number || ' Day')
      BETWEEN Date('now', 'LocalTime', 'start of month') AND Date('now', 'LocalTime', 'start of month', '+1 month', '-1 day')
  GROUP BY Date('now', 'LocalTime', 'start of month',  '+' || nns.number || ' Day')
  SQL
end

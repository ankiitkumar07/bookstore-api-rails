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

ActiveRecord::Schema.define(version: 2020_07_04_062833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.string "title"
    t.string "body"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_comments_on_book_id"
    t.index ["user_id"], name: "index_book_comments_on_user_id"
  end

  create_table "book_shelves", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_shelves_on_book_id"
    t.index ["user_id"], name: "index_book_shelves_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.float "price"
    t.string "isbn"
    t.string "book_path"
    t.string "cover_path"
    t.bigint "author_id", null: false
    t.bigint "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_following_id", null: false
    t.bigint "user_follower_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_follower_id"], name: "index_follows_on_user_follower_id"
    t.index ["user_following_id"], name: "index_follows_on_user_following_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "from_user_id", null: false
    t.bigint "book_id", null: false
    t.bigint "to_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_recommendations_on_book_id"
    t.index ["from_user_id"], name: "index_recommendations_on_from_user_id"
    t.index ["to_user_id"], name: "index_recommendations_on_to_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "user_phone"
    t.string "pic_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "encrypted_password"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "book_comments", "books"
  add_foreign_key "book_comments", "users"
  add_foreign_key "book_shelves", "books"
  add_foreign_key "book_shelves", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "follows", "users", column: "user_follower_id"
  add_foreign_key "follows", "users", column: "user_following_id"
  add_foreign_key "recommendations", "books"
  add_foreign_key "recommendations", "users", column: "from_user_id"
  add_foreign_key "recommendations", "users", column: "to_user_id"
  add_foreign_key "user_profiles", "users"
end

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

ActiveRecord::Schema.define(version: 2021_03_25_104146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.string "year"
    t.string "genre"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "author"
    t.string "page_count"
    t.string "thumbnail_url"
    t.string "google_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.bigint "library_book_id"
    t.index ["library_book_id"], name: "index_chatrooms_on_library_book_id"
    t.index ["recipient_id"], name: "index_chatrooms_on_recipient_id"
    t.index ["sender_id"], name: "index_chatrooms_on_sender_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "library_books", force: :cascade do |t|
    t.bigint "library_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "condition"
    t.string "status", default: "available"
    t.index ["book_id"], name: "index_library_books_on_book_id"
    t.index ["library_id"], name: "index_library_books_on_library_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "status"
    t.bigint "library_book_id", null: false
    t.bigint "wishlist_book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "distance"
    t.index ["library_book_id"], name: "index_matches_on_library_book_id"
    t.index ["wishlist_book_id"], name: "index_matches_on_wishlist_book_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read", default: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "swap_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "library_book_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "chatroom_id"
    t.index ["chatroom_id"], name: "index_swap_requests_on_chatroom_id"
    t.index ["library_book_id"], name: "index_swap_requests_on_library_book_id"
    t.index ["user_id"], name: "index_swap_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlist_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "wishlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_wishlist_books_on_book_id"
    t.index ["wishlist_id"], name: "index_wishlist_books_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "libraries", "users"
  add_foreign_key "library_books", "books"
  add_foreign_key "library_books", "libraries"
  add_foreign_key "matches", "library_books"
  add_foreign_key "matches", "wishlist_books"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "swap_requests", "chatrooms"
  add_foreign_key "swap_requests", "library_books"
  add_foreign_key "swap_requests", "users"
  add_foreign_key "wishlist_books", "books"
  add_foreign_key "wishlist_books", "wishlists"
  add_foreign_key "wishlists", "users"
end

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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_templates", comment: "掲示板投稿テンプレート", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", comment: "掲示板投稿データ", force: :cascade do |t|
    t.string "profile_id", null: false
    t.string "title", null: false
    t.datetime "post_at", null: false
    t.string "category", null: false
    t.integer "area", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", comment: "掲示板投稿データ", force: :cascade do |t|
    t.string "source_site_id", null: false
    t.string "user_id", null: false
    t.string "name", null: false
    t.integer "age", null: false
    t.integer "sex", null: false
    t.integer "from", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_sites", comment: "出会い系サイトの情報", force: :cascade do |t|
    t.string "key", null: false, comment: "ユニークキー"
    t.string "name", null: false, comment: "サイト名"
    t.string "affiliate_url", null: false, comment: "アフィリエイトURL"
    t.string "login_user", comment: "ログインユーザー情報"
    t.string "login_password", comment: "ログインパスワード情報"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login_url", null: false, comment: "クロール開始URL"
    t.boolean "activate_flag", null: false, comment: "操作対象"
    t.bigint "post_id"
    t.index ["key"], name: "index_source_sites_on_key", unique: true
    t.index ["post_id"], name: "index_source_sites_on_post_id"
  end

end

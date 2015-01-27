# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141227201558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name",                                null: false
    t.string   "address",                             null: false
    t.string   "phone",                               null: false
    t.string   "menu"
    t.text     "description",                         null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.decimal  "rating",      precision: 2, scale: 1
    t.string   "address_2"
    t.string   "city",                                null: false
    t.string   "zip_code",                            null: false
    t.integer  "state_id"
  end

  add_index "clients", ["category_id"], name: "index_clients_on_category_id", using: :btree
  add_index "clients", ["state_id"], name: "index_clients_on_state_id", using: :btree
  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",     default: 0
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "client_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["client_id"], name: "index_favorites_on_client_id", using: :btree
  add_index "favorites", ["customer_id"], name: "index_favorites_on_customer_id", using: :btree

  create_table "message_threads", force: true do |t|
    t.integer  "client_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_threads", ["client_id"], name: "index_message_threads_on_client_id", using: :btree
  add_index "message_threads", ["customer_id"], name: "index_message_threads_on_customer_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "body",                               null: false
    t.integer  "message_thread_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "star",               default: false
    t.boolean  "sent_from_customer",                 null: false
  end

  add_index "messages", ["message_thread_id"], name: "index_messages_on_message_thread_id", using: :btree

  create_table "multiple_choices", force: true do |t|
    t.string   "choice1"
    t.string   "choice2"
    t.string   "choice3"
    t.string   "choice4"
    t.string   "choice5"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "multiple_choices", ["question_id"], name: "index_multiple_choices_on_question_id", using: :btree

  create_table "question_responses", force: true do |t|
    t.string   "response",           null: false
    t.integer  "question_id"
    t.integer  "survey_response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_responses", ["question_id"], name: "index_question_responses_on_question_id", using: :btree
  add_index "question_responses", ["survey_response_id"], name: "index_question_responses_on_survey_response_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "category",   null: false
    t.string   "prompt",     null: false
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "detail"
    t.integer  "client_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rating",      precision: 2, scale: 1,             null: false
    t.integer  "upvotes",                             default: 0
  end

  add_index "reviews", ["client_id"], name: "index_reviews_on_client_id", using: :btree
  add_index "reviews", ["customer_id"], name: "index_reviews_on_customer_id", using: :btree

  create_table "rewards", force: true do |t|
    t.integer  "current_points",  default: 0
    t.integer  "points_redeemed", default: 0
    t.string   "category",                    null: false
    t.integer  "client_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["client_id"], name: "index_rewards_on_client_id", using: :btree
  add_index "rewards", ["customer_id"], name: "index_rewards_on_customer_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_responses", force: true do |t|
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_responses", ["survey_id"], name: "index_survey_responses_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.boolean  "flag",       null: false
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["client_id"], name: "index_surveys_on_client_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token",             default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

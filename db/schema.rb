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

ActiveRecord::Schema.define(version: 20140922224546) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", force: true do |t|
    t.string   "company"
    t.string   "contact"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobapplications", force: true do |t|
    t.string   "coverletter"
    t.string   "dateofapplication"
    t.string   "status"
    t.integer  "job_id"
    t.integer  "jobseeker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "application_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "category_id"
    t.string "tags_id"
    t.string "employer_id"
  end

  create_table "jobseekers", force: true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.string   "phonenumber"
    t.string   "skills"
    t.string   "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130618035932) do

  create_table "answers", :force => true do |t|
    t.integer "question_id",    :null => false
    t.text    "value",          :null => false
    t.text    "description",    :null => false
    t.integer "next_questions", :null => false
  end

  add_index "answers", ["question_id"], :name => "idx_answers_on_question_id"

  create_table "question_forms", :force => true do |t|
    t.string "description", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer "question_form_id",                              :null => false
    t.string  "answer_ids",                                    :null => false
    t.string  "input_type",       :limit => 50,                :null => false
    t.string  "input_name",       :limit => 50,                :null => false
    t.text    "description",                                   :null => false
    t.integer "sort_num"
    t.integer "hidden",           :limit => 1,  :default => 0, :null => false
  end

end

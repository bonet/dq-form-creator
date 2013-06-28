class CreateQuestions < ActiveRecord::Migration
  
  def change
    create_table "questions", :force => true do |t|
      t.integer "question_form_id",               :null => false
      t.string  "answer_ids",       :limit => 255,:null => false
      #t.integer "parent_answer_id"
      t.string  "input_type",       :limit => 50, :null => false
      t.string  "input_name",       :limit => 50, :null => false
      t.text    "description",                    :null => false
      t.integer "sort_num"
      t.integer "hidden",           :limit => 1,  :null => false,   :default => 0
    end
  end

end

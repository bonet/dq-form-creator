class CreateAnswers < ActiveRecord::Migration
  
  def change
    create_table "answers", :force => true do |t|
      t.integer "question_id",      :null => false
      t.text    "description",      :null => false
      t.integer "next_question_id"
    end
    
    add_index "answers", ["question_id"], :name => "idx_answers_on_question_id"
  end

end

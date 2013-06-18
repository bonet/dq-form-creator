class CreateQuestionForms < ActiveRecord::Migration
  
  def change
    create_table "question_forms", :force => true do |t|
      t.string "description", :null => false
    end
  end

end

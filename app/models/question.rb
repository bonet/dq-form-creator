class Question < ActiveRecord::Base
  
  has_many :answers
  
  def get_questions
    
  end
  
end
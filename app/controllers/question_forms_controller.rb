class QuestionFormsController < ApplicationController
  
  def get_questions
    qf = QuestionForm.new
    questions = qf.get_questions(params[:qfid])
    render :text => questions.to_json
  end
  
  def get_answers
    qf = QuestionForm.new
    answers = qf.get_answers(params[:qfid])
    render :text => answers.to_json
  end
  
=begin
  def get_question_answers_relationships
    qf = QuestionForm.new
    qar = qf.get_question_answers_relationships(params[:qfid])
    render :text => qar.to_json
  end
=end

end
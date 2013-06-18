class QuestionForm < ActiveRecord::Base
  
  has_many :questions
  
  def get_questions(qfid)
    questions = Question.where(question_form_id: qfid)
    return questions
  end
  
  def get_answers(qfid)
    answers = Answer.joins("LEFT OUTER JOIN questions ON questions.id=answers.question_id WHERE questions.question_form_id = " + qfid.to_s)
    return answers
  end
  
  def get_question_answers_relationships(qfid)
    
    qfid = ActiveRecord::Base.connection.quote(qfid)
    
    query = "SELECT questions.id, answers.id FROM questions LEFT JOIN answers ON questions.id = answers.question_id ";
    query += " WHERE questions.question_form_id = #{qfid}"
    
    qa_hash = {}
    res = ActiveRecord::Base.connection.execute(query)
    
    res.each do |x|
      qa_hash[x[0]] = qa_hash.has_key?(x[0]) ? qa_hash[x[0]].split(',').push(x[1]).join(',') : x[1].to_s
    end

    return qa_hash

  end
end
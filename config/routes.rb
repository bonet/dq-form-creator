Questionnaire::Application.routes.draw do
  
=begin
  match '/feedlist', :to => 'pages#feedlist'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/feed_subscribe', :to => 'users#feed_subscribe'
=end

  match '/get_questions/:qfid', :to => 'question_forms#get_questions'
  match '/get_answers/:qfid', :to => 'question_forms#get_answers'
  #match '/get_question_answers_relationships/:qfid', :to => 'question_forms#get_question_answers_relationships'

  root :to => 'pages#home'
  
end

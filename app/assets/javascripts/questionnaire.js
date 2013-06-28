$(function(){
 	
	var qfid = 1;
	
	//Question Model
	var Question = Backbone.Model.extend();
	
	//Question Collection
	var QuestionList = Backbone.Collection.extend({
		model: Question,
		url: "/get_questions/1"
	});
	
	
	//Answer Model
	var Answer = Backbone.Model.extend();
	
	//Answer Collection
	var AnswerList = Backbone.Collection.extend({
		model: Answer,
		url: "/get_answers/1"
		
	});
	
	
	//Question View
	var QuestionView = Backbone.View.extend({
		tagName: "label",
		initialize: function() {
			//this.$el.attr('for', this.model.get('input_name'));
			
		},
		render: function(){
			this.$el.html(this.model.get('description'));
			return this;
		}
	});
	
	//Answer Collection View
	var AnswerListView = Backbone.View.extend({
		tagname: "div",
		initialize: function() {
			this.$el.attr('id', 'answer-for-question-' + this.options.question_id);
		},
		
		render: function() {
			
			_.each(this.options.models, function(a){
				
				if(this.options.input_type == "RADIO" || this.options.input_type == "CHECK") {
					this.$el.append("<input type='"+this.options.input_type+"' name='"+this.options.input_name + "' id='"+a.get('value') + "' value='"+a.get('value') + "' /> <label for='"+a.get('value') + "'>"+a.get('description') + "</label>");
				}
				else if(this.options.input_type == "TEXT") {
					this.$el.append("<input type='TEXT' name='"+this.options.input_name + "' />");
				}
			}, this);
			
			return this;
		}
		
	});
	
	
	
	//Form View
	var FormView = Backbone.View.extend({
		el: '#question-form-1',
		
		initialize: function() {

			console.log("FormView initialized");
			
			this.questions = new QuestionList;
			this.questions.fetch({async:false}); 	//Set async to false; so that it waits for the fetch operation to finish first.
			
			this.answers = new AnswerList;
			this.answers.fetch({async:false}); 
			
			/*
			var answer_array = new Array();
			
			this.answers.each(function (answer) {
				var question_id = answer.get('question_id');
				
				if (answer_array[question_id] === undefined) {
					answer_array[question_id] = Array();
				}
				
				answer_array[question_id].push(answer);
				
			});
			
			this.answer_array = answer_array;
			*/
			
			this.render();
			
		},
		
		render: function() {
			
			console.log("FormView Rendered");

			this.questions.each(function(q){
				
				var div_question = $("<div id='block-question-"+q.get('id')+"'></div>");
				
				if(q.get('hidden') == "1") {
					div_question.addClass('hidden');
				}
				
				var q_view = new QuestionView({model: q});
				
				q_view.render().$el.appendTo(div_question);
				
				/*
				var al = this.answer_array[q.get('id')];
				var al_view = new AnswerListView({models: al});
				*/
				
				var al_filtered = this.answers.where({question_id: q.get('id')});
				var al_view = new AnswerListView({models: al_filtered, question_id: q.get('id'), input_type: q.get('input_type'), input_name: q.get('input_name')});
				
				al_view.render().$el.appendTo(div_question);
				this.$el.append(div_question);
				
			}, this);
			
			

		}
	});
	
	
	var f_view = new FormView;

});

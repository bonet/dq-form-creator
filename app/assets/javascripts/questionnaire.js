var qfid = 1;

Question = Backbone.Model.extend();

QuestionCollection = Backbone.Model.extend({
	model: Question,
	url: "/get_questions/" + qfid
});

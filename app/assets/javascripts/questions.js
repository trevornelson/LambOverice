$(document).ready(function(){

	MarkdownWidget.listener('#question-content', '#question-preview');

	MarkdownWidget.listener('#question-title', '#preview-title');

});


var MarkdownWidget = function(){
	var listener = function(input_field, preview_div){
		$(input_field).on('focus', function(e){
			$(input_field).keyup(function(){
				$(preview_div).text($(input_field).val());
			})
		});
	}

	return {
		listener: listener
	}
}();



var Question = function(params){
  this.id = params.id;
  this.title = params.title;
  this.category = params.category;
  this.user = params.username;
}

Question.prototype.view = function(){
  return "<li class='list-group-item'><h3><a href='/questions/"+this.id+"'>"+this.title+"</a></h3></li>";

}

Question.prototype.show = function(container){
  $(container).append(this.view())
}

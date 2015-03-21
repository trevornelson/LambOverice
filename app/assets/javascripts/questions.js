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
/* Array that will store all of the questions, that are brought by ajax on document ready */
var questionsArray = [];

//* search inside of the string for similaritites between input and question, in this case, the question's user, category, title.
var research = function(param, input){
  return param.toLowerCase().search(input) != -1;
}

$(document).ready(function(){
  //* GET all of the questions on document ready
  $.get('/questions', function(response){
    console.log(response)
    response.questions.map(function(question){
      questionsArray.push(new Question(question))
    })
  })
  $(document).on('submit','.search_form', function(event){
    event.preventDefault();
    var input = $('#search_request').val();
    $('.search_results').html("<h3>Results for " + input +"</h3>");
    //* great tool to select similar objects, kind of like select in ruby
    var result = $.grep(questionsArray, function(question){
      return research(question.title, input) || research(question.category, input) || research(question.user, input);
    });
    //* display results of the research on the page
    result.map(function(question){
      question.show('.search_results');
    })
  })
})
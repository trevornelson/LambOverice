$(document).ready(function(){
  // $('.new_comment').toggle();
  $('.post_comment').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);
    var form = $target.context.nextElementSibling;
    $(form).toggle();
  })
})
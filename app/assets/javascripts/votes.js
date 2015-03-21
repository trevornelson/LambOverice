$(document).ready(function(){
  $('.vote-buttons').on('click', function(e){
    e.preventDefault();
    console.log('clicked button')
    var data = $(this).data();
    var new_vote = new vote(data['voteableid'], data['voteabletype'], data['direction']);
    var vote_count_element = $('#' + data['voteabletype'] + '-' + data['voteableid'] + '-' + 'votecount');

    $.ajax({
      type: 'post',
      url: '/votes',
      data: new_vote,
      success: function(result) {
        vote_count_element.text(result.vote_count);
      },
      error: function() {
        alert('Sorry');
      }
    })
  });


});

function vote(voteable_id, voteable_type, direction) {
  this.voteable_id = voteable_id;
  this.voteable_type = voteable_type;
  this.direction = direction;
}

function voteError(element) {
  element.popover()
}

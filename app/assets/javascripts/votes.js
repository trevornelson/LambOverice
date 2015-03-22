$(document).ready(function(){
  $('.vote-buttons').on('click', function(e){
    var $data = $(this).data();
    var new_vote = new vote($data['voteableid'], $data['voteabletype'], $data['direction']);
    var vote_count_element = $('#' + $data['voteabletype'] + '-' + $data['voteableid'] + '-' + 'votecount');

    $.ajax({
      type: 'post',
      url: '/votes',
      data: new_vote,
      success: function(result) {
        vote_count_element.text(result.vote_count);
      },
      error: function(result) {
        voteError($(e.target), result.responseJSON.error);
      }
    })
  });


});

function vote(voteable_id, voteable_type, direction) {
  this.voteable_id = voteable_id;
  this.voteable_type = voteable_type;
  this.direction = direction;
}

function voteError(element, error) {
  element.popover({title: 'Unable to vote',
                  content: error,
                  placement: 'right'
                });
  element.popover('show');
  setTimeout(function(){
    element.popover('hide');
  }, 2000);
}

/** @jsx React.DOM **/
$(document).ready(function(){
  var data = [
    {user: 'Trevor Nelson', text: 'Heres the first comment!'},
    {user: 'Crab Daddy', text: 'CrAbZ R DeLiSh'}
  ];

  var CommentBox = React.createClass({
    render: function() {
      return (
        <div className="commentbox">
          <h2>Comments</h2>
          <CommentList data={data} />
        </div>
      );
    }
  });

  var CommentList = React.createClass({
    render: function() {
      var commentNodes = this.props.data.map(function (comment) {
        return (
          <Comment user={comment.user} text={comment.text} />
        );
      });
      return (
        <div className="commentList">
          {commentNodes}
        </div>
      );
    }
  });

  var Comment = React.createClass({
    render: function() {
      return (
        <li className="list-group-item">
          <p>{this.props.text}</p>
          <a href="#">
            <strong>{this.props.user}</strong>
          </a>
        </li>
      );
    }

  });

  var CommentForm = React.createClass({
    render: function() {
      return (
        <li class="list-group-item">

        </li>
      );
    }

  });

  React.render(
    <CommentBox />,
    document.getElementById('question-comment-box')
  );
});

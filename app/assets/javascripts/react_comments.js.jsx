/** @jsx React.DOM **/
$(document).ready(function(){
  var data = [
    {user: 'Trevor Nelson', text: 'Heres the first comment!'},
    {user: 'Crab Daddy', text: 'CrAbZ R DeLiSh'}
  ];

  var CommentBox = React.createClass({
    loadCommentsFromServer: function() {
      $.ajax({
        url: this.props.url,
        dataType: 'json',
        type: 'GET',
        success: function(data) {
          if (Array.isArray(data)) {
            this.setState({data: data});
          } else {
            this.setState({data: [data]});
          }
        }.bind(this),
        error: function() {
          console.log("something went wrong");
        }.bind(this)
      });
    },
    getInitialState: function() {
      return {data: []};
    },
    componentDidMount: function() {
      this.loadCommentsFromServer();
    },
    render: function() {
      return (
        <div className="commentbox">
          <h2>Comments</h2>
          <CommentList data={this.state.data} />
          <CommentForm />
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

  var CommentList = React.createClass({
    render: function() {
      console.log(Array.isArray(this.props.data));
      var commentNodes = this.props.data.map(function(comment) {
        return (
          <Comment user={comment['user_id']} text={comment['content']}></Comment>
        );
      });
      return (
        <div className="commentList">
          {commentNodes}
        </div>
      );
    }
  });



  var CommentForm = React.createClass({
    render: function() {
      return (
        <form className="commentForm">
          <input type="text" placeholder="Comment..." ref="content" />
          <input type="hidden" value="" ref="" />
          <input type="hidden" value="" ref="" />
          <input type="hidden" value="" ref="" />
          <input type="hidden" value="" ref="" />
          <input type="hidden" value="" ref="" />
          <input type="hidden" value="" ref="" />
          <input type="submit" />
        </form>
      );
    }

  });

  React.render(
    <CommentBox url="/questions/2/comments" />,
    document.getElementById('question-comment-box')
  );
});

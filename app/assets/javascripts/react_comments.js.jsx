/** @jsx React.DOM **/
var CommentBox = React.createClass({
  render: function() {
    return (
      <li>
        <h2>Trevor Nelson</h2>
        <p>Some test text to render</p>
      </li>
    );
  }
});


React.render(
  <CommentBox />,
  document.getElementById('question-comment-box')
);

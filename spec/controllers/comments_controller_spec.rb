require 'rails_helper'
require 'pp'

describe CommentsController do


  context "the comments tests"

  # See  comments in AnswersController spec
    let(:user){User.create(username: "Leo Dongchul", password: '123', email: "therio@gmail.com")}
    let(:question) {Question.create(title: "Who is DongChul ?", content: "He is mysterious and mindful, who is he, really ?", category_id: 1, user: user)}
    let(:answer) {Answer.create(question: question, user: user, content: "Makes sense")}


    #antipattern
    describe 'Commenting on a question' do
      before(:each) do
        user
        question
        session[:user_id] = user.id
        request.env["HTTP_REFERER"] = "question"
      end

      it 'creates a comment to a specific question' do
        post :create, {:question_id => question.id, comment: {content: "I feel like this answer is accurate"} }
        expect(response).to redirect_to("question")
      end
    end

    describe 'Commenting on an answer' do

      it 'creates a comment to a specific answer' do
        # wtf?  This test seems to make a lot of assumptions.  you're loading
        # up the enviornment hash with some magic words...feels weird to me.
        request.env["HTTP_REFERER"] = "question"
        answer
        session[:user_id] = user.id
        post :create, {:answer_id => answer.id, comment: {content: "I feel like this answer is accurate"} }
        expect(response).to redirect_to("question")
      end

    end
end

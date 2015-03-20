require 'rails_helper'
require 'pp'

describe AnswersController do
  let(:user){User.create(username: "Leo Dongchul", password: '123', email: "therio@gmail.com")}
  let(:question) {Question.create(title: "Who is DongChul ?", content: "He is mysterious and mindful, who is he, really ?", category_id: 1, user: user)}

  context 'hey' do
    before(:each) do
      user
      question
      session[:user_id] = user.id
    end

    describe 'GET routes' do

      it "shows the form of a new answer to a specific question" do
        get :new, :question_id => question.id
        expect(response).to be_ok
      end

    end

    describe "POST routes" do

      it "POST /questions/x/answers/new" do
        post :create, {:question_id => question.id, :answer => {content: "I think Dongchul is a very rare specimen, happy all the time and not caring about anyone around him, he is an example to every human being."}}
        expect(response).to redirect_to(question)
      end

      it 'doesnt record a wrong answer' do
        post :create, {:question_id => question.id, answer: {content:"" }}
        expect(response).to redirect_to(new_question_answer_path(question.id))
      end

    end
  end

end

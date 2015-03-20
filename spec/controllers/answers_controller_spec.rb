require 'rails_helper'
require 'pp'

describe AnswersController do
  let(:user){User.create(username: "Leo Dongchul", password: '123', email: "therio@gmail.com")}
  let(:question) {Question.create(title: "Who is DongChul ?", content: "He is mysterious and mindful, who is he, really ?", category_id: 1, user: user)}

  context 'creating a new answer' do
    before(:each) do
      user
      question
      session[:user_id] = user.id
    end


    describe "POST routes" do

      it "POST /questions/x/answers/new" do
        post :create, {:question_id => question.id, :answer => {content: "I think Dongchul is a very rare specimen, happy all the time and not caring about anyone around him, he is an example to every human being."}}
        expect(response).to redirect_to(question)
      end


    end
  end

end

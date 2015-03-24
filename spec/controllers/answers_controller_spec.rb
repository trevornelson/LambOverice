require 'rails_helper'

describe AnswersController do
  # 1.  Don't use real email address b/c you can span them.  The @examplecom
  # domain exists exclusively for this purpose
  # 2.  Also, this should really be encapsulated in a factory.  The neat thing
  # about factories is that you can use them in the test environment as well as
  # in your seedfile.  So you can have neater seeds as well as tests, and
  # that's DRY.
  let(:user){User.create(username: "Leo Dongchul", password: '123', email: "therio@gmail.com")}
  # Factories also allow you to create associations
  let(:question) {Question.create(title: "Who is DongChul ?", content: "He is mysterious and mindful, who is he, really ?", category_id: 1, user: user)}

  context 'creating a new answer' do
    # this totally sucks.  This is an antipattern.
    #
    #No no nono.  If you need to eagerly load something, use `let!()`.

    before(:each) do
      user
      question
      session[:user_id] = user.id
    end


    describe "POST routes" do

      it "POST /questions/x/answers/new" do
        # VISUALIZE a factory
        #
        # post :create attributes_for(:question)
        post :create, {:question_id => question.id, :answer => {content: "I think Dongchul is a very rare specimen, happy all the time and not caring about anyone around him, he is an example to every human being."}}
        expect(response).to redirect_to(question)
      end


    end
  end

end

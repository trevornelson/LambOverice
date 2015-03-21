class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    if request.xhr?

      questions = Question.all.map{|ques| {id: ques.id, category: ques.category.name, title: ques.title, username: ques.user.username} }
      render :json => {questions: questions}
    end
  end

  def show
    @question = Question.find_with_included_relations(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    category = Category.find_or_create_by(name: params[:question][:category_name])
    params[:question][:category_id] = category.id
    params[:question][:user_id] = session[:user_id]
    Question.create(question_params)
    redirect_to curr_user_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :category_name, :category_id, :user_id)
  end

end

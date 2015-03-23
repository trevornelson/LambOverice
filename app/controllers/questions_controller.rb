class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    if request.xhr?

      questions = Question.all.map{|ques| {id: ques.id, category: ques.category.name, title: ques.title, username: ques.user.username} }
      render :json => {questions: questions}
    end
  end

  def show
    @question = Question.with_all_relations(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    category = Category.find_or_create_by(name: params[:question][:category_name])
    params[:question][:category_id] = category.id
    params[:question][:user_id] = session[:user_id]
    Question.create(question_params)
    redirect_to curr_user_path
  end

  def recent
    @questions = Question.all
    @sort = 'recent'
    render 'questions/index'
  end

  def trending
    @questions = Question.all
    @sort = 'trending'
    render 'questions/index'
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :category_name, :category_id, :user_id)
  end

end

class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(vote_count: :desc)
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
    params[:question][:user_id] = session[:user_id]
    Question.create(question_params)
    redirect_to curr_user_path
  end

  def recent
    @questions = Question.all.order(created_at: :desc)
    render 'questions/index'
  end

  def trending
    @questions = Question.trending
    render 'questions/index'
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :category_id, :user_id)
  end

end

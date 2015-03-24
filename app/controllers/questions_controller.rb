class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(vote_count: :desc)
    # If you're going to branch logic based on Asynch, look at the respond_to
    #

    # BTW: This is crazy inefficient.  You're pulling the entire universe to
    # map though it, you can use SQL to do this faster.  Probably not a problem
    # today, but when you get to 50K questions, it will hurt.
    @questions = Question.all.includes("category").map{|ques| {id: ques.id, category: ques.category.name, title: ques.title, username: ques.user.username} }
    respond_to do |format|
      format.html
      format.json { @questions }
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

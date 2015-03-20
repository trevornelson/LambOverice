class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    if request.xhr?
      render :json => {questions: @questions}
    end
  end

  def show
    @question = Question.includes(:user, :category, comments: :user, answers: [{comments: :user}, :user]).find(params[:id])
  end

  def create
  end
end

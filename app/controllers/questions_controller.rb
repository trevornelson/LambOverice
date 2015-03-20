class QuestionsController < ApplicationController
  def index
    @questions = Question.all   
    if request.xhr?
      render :json => {questions: @questions} 
    end
  end

  def show
  end

  def create
  end
end

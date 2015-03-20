class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(content: params[:answer][:content], user_id: session[:user_id])
    if answer.save
      redirect_to question
    else
      # Add ajax to display the error message getting back from validations
      redirect_to new_question_answer_path(question.id)
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    question = answer.question
    if answer.update(content: params[:answer][:content])
      redirect_to question
    else
      redirect_to :back
    end
  end

  def delete
    answer = Answer.find(params[:id])
  end

end

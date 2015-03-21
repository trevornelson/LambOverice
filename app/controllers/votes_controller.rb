class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    vote[:user_id] = 1

    if vote.save
      render json: {vote_count: vote.voteable.vote_count, status: 200}
    else
      puts vote.errors.messages[0]
      render json: { error: vote.errors.values[0] }, status: 403
    end
  end

  private

  def vote_params
    params.permit(:voteable_id, :voteable_type, :direction)
  end

end

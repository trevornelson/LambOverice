class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    vote[:user_id] = curr_user.id if curr_user

    if vote.save
      render json: {vote_count: vote.voteable.vote_count, status: 200}
    else
      render json: { error: vote.errors.values[0] }, status: 403
    end
  end

  private

  def vote_params
    params.permit(:voteable_id, :voteable_type, :direction)
  end

end

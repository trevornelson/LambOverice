class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :content, length: {minimum: 10}

  def vote_count
    votes = self.votes
    return 1 if votes.count == 0
    votes.where(direction: 'Up').count - votes.where(direction: 'Down').count
  end

end

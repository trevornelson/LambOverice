class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :content, length: {minimum: 10}

  def incr_vote_count
    self.vote_count += self.vote_count
  end

  def decr_vote_count
    self.vote_count -= self.vote_count
  end

end

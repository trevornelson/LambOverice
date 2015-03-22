class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments

  def karma
    question_karma + answer_karma + comment_karma
  end

  private

  def question_karma
    karma_weight = 2
    questions.map(&:vote_count).inject(0, &:+) * karma_weight
  end

  def answer_karma
    karma_weight = 4
    answers.map(&:vote_count).inject(0, &:+) * karma_weight
  end

  def comment_karma
    karma_weight = 0.5
    (comments.inject(0, &:+) * karma_weight).to_i
  end

end

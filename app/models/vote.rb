class Vote < ActiveRecord::Base
  before_save :update_vote_count

  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates_uniqueness_of :voteable_id, scope: [:user_id, :voteable_type], message: "You already voted"
  validate :check_self_voting

  def check_self_voting
    if voteable.user.id == user_id
      errors.add(:user_id, "Can't vote on your own post")
    end
  end

  def update_vote_count
    if direction == 'Up'
      voteable.incr_vote_count
    elsif direction == 'Down'
      voteable.decr_vote_count
    end
  end

end

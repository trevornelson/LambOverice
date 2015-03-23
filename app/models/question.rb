class Question < ActiveRecord::Base

  belongs_to :user
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :category

  scope :with_all_relations, -> (question_id) { includes(:user,
                                                         :category,
                                                         :comments => :user,
                                                         :answers => [:user,
                                                                      {:comments => :user}]
                                                          ).find(question_id) }

  def incr_vote_count
    self.increment!(:vote_count)
  end

  def decr_vote_count
    self.decrement!(:vote_count)
  end

  def self.trending
    all.sort {|a,b| b.past_week_trend <=> a.past_week_trend}
  end

  def past_week_trend
    past_week_answers + past_week_comments
  end

  private

  def past_week_answers
    answers.where('created_at >= :week_ago', week_ago: Time.now - 7.days).count
  end

  def past_week_comments
    comments.where('created_at >= :week_ago', week_ago: Time.now - 7.days).count
  end

end

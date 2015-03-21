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

end

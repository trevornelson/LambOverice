class Question < ActiveRecord::Base
  scope :find_with_included_relations, -> (id){includes(:user, :category, comments: :user, answers: [{comments: :user}, :user]).find(id)}

  belongs_to :user
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :category
<<<<<<< HEAD
=======

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
>>>>>>> Created question#with_all_relations scope and refactored for readability
end

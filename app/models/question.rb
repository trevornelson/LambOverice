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

  def vote_count
    votes = self.votes
    1 + (votes.where(direction: 'Up').count - votes.where(direction: 'Down').count)
  end
>>>>>>> Created question#with_all_relations scope and refactored for readability
end

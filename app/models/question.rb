class Question < ActiveRecord::Base
  scope :find_with_included_relations, -> (id){includes(:user, :category, comments: :user, answers: [{comments: :user}, :user]).find(id)}

  belongs_to :user
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :category
end

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :category
end

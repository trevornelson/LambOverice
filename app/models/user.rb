class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments

end

require 'rails_helper'

describe Question do
  let(:question_user) { User.create(username: 'test_user', password: '12345', email: 'test_user@test.com') }
  let(:other_user) { User.create(username: 'test_user2', password: '12345', email: 'test_user2@test.com') }
  let(:question) { Question.create(user: question_user, title: 'How do I run tests with Rspec?') }

  describe '#vote_count' do
    it 'should initialize with 1 vote' do
      expect(question.vote_count).to eq(1)
    end

    it 'should decrease after a down vote' do
      Vote.create(user: other_user, voteable: question, direction: 'Down')
      expect(question.vote_count).to eq(0)
    end

    it 'should increase after an up vote' do
      Vote.create(user: other_user, voteable: question, direction: 'Up')
      expect(question.vote_count).to eq(2)
    end

  end

end

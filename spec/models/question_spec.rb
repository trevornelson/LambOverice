require 'rails_helper'

describe Question do
  let(:question_user) { User.create(username: 'test_user', password_digest: '12345', email: 'test_user@test.com') }
  let(:other_user) { User.create(username: 'test_user2', password_digest: '12345', email: 'test_user@test.com') }
  let(:question) { Question.create(user_id: 1, title: 'How do I run tests with Rspec?') }

  describe '#vote_count' do
    it 'should initialize with 1 vote' do
      expect(question.vote_count).to eq(1)
    end

    it 'should decrease after a down vote' do
      Vote.create(user_id: other_user.id, voteable: question, direction: 'Down')
      expect(question.vote_count).to eq(0)
    end

    it 'should increase after an up vote' do
      Vote.create(user_id: other_user.id, voteable: question, direction: 'Up')
      expect(question.vote_count).to eq(2)
    end

  end

end

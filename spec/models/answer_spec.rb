require 'rails_helper'

describe "Answer" do
    let(:question_user) { User.create(username: 'test_user', password_digest: '12345', email: 'test_user@test.com') }
    let(:other_user) { User.create(username: 'test_user2', password_digest: '12345', email: 'test_user@test.com') }
    let(:question) { Question.create(user_id: question_user.id, title: 'How do I run tests with Rspec?') }
    let(:answer) { Answer.create(user_id: other_user.id, question_id: question.id, content: 'Go look on the internet.') }

  describe '#vote_count' do

    it 'should initialize with 1 vote' do
      expect(answer.vote_count).to eq(1)
    end

    it 'should decrease after a down vote' do
      Vote.create(user_id: question_user.id, voteable: answer, direction: 'Down')
      expect(answer.vote_count).to eq(0)
    end

    it 'should increase after an up vote' do
      Vote.create(user_id: question_user.id, voteable: answer, direction: 'Up')
      expect(answer.vote_count).to eq(2)
    end

  end

end

require 'rails_helper'

describe "Answer" do
  #Factories, so much...so so much.
  # Watch your indentation, Trevor
    let(:question_user) { User.create(username: 'test_user', password: '12345', email: 'test_user@test.com') }
    let(:other_user) { User.create(username: 'test_user2', password: '12345', email: 'test_user2@test.com') }
    let(:question) { Question.create(user: question_user, title: 'How do I run tests with Rspec?') }
    let(:answer) { Answer.create(user: other_user, question: question, content: 'Go look on the internet.') }

  describe '#vote_count' do

    it 'should initialize with 1 vote' do
      expect(answer.vote_count).to eq(1)
    end

    it 'should decrease after a down vote' do
      Vote.create(user: question_user, voteable: answer, direction: 'Down')
      expect(answer.vote_count).to eq(0)
    end

    it 'should increase after an up vote' do
      Vote.create(user: question_user, voteable: answer, direction: 'Up')
      expect(answer.vote_count).to eq(2)
    end

  end

end

require 'rails_helper'
require 'pp'

describe Vote do
  let(:question_user) { User.create(username: 'test_user', password: '12345', email: 'test_user@test.com') }
  let(:other_user) { User.create(username: 'test_user2', password: '12345', email: 'test_user2@test.com') }
  let(:question) { Question.create(user: question_user, title: 'How do I run tests with Rspec?') }
  let(:answer) { Answer.create(user: other_user, question: question, content: 'Go look on the internet.') }

  it 'should allow another user to vote on a question' do
    vote = Vote.new(user: other_user, voteable: question, direction: 'Up')
    expect(vote.valid?).to eq(true)
  end

  it 'should not allow a user to vote on their own question' do
    vote = Vote.new(user: question_user, voteable: question, direction: 'Down')
    expect(vote.valid?).to eq(false)
  end

  it 'should not allow a user to vote twice on a question' do
    Vote.create(user: other_user, voteable: question, direction: 'Up')
    vote = Vote.new(user: other_user, voteable: question, direction: 'Down')
    expect(vote.valid?).to eq(false)
  end

  it 'should allow another user to vote on an answer' do
    vote = Vote.new(user: question_user, voteable: answer, direction: 'Up')
    expect(vote.valid?).to eq(true)
  end

  it 'should not allow a user to vote on their own answer' do
    vote = Vote.new(user: other_user, voteable: answer, direction: 'Up')
    expect(vote.valid?).to eq(false)
  end

  it 'should not allow a user to vote twice on an answer' do
    Vote.create(user: question_user, voteable: answer, direction: 'Up')
    vote = Vote.new(user: question_user, voteable: answer, direction: 'Down')
    expect(vote.valid?).to eq(false)
  end

end

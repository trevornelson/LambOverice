require 'rails_helper'

describe Vote do
  let(:question_user) { User.create(username: 'test_user', password_digest: '12345', email: 'test_user@test.com') }
  let(:other_user) { User.create(username: 'test_user2', password_digest: '12345', email: 'test_user@test.com') }
  let(:question) { Question.create(user_id: question_user.id, title: 'How do I run tests with Rspec?') }
  let(:answer) { Answer.create(user_id: other_user.id, question_id: question.id, content: 'Go look on the internet.') }

  it 'should allow another user to vote on a question' do
    vote = Vote.new(user_id: other_user.id, voteable: question, direction: 'Up')
    expect(vote.valid?).to eq(true)
  end

  it 'should not allow a user to vote on their own question' do
    vote = Vote.new(user_id: question_user.id, voteable: question, direction: 'Down')
    expect(vote.valid?).to eq(false)
  end

  it 'should not allow a user to vote twice on a question' do
    Vote.create(user_id: other_user.id, voteable: question, direction: 'Up')
    vote = Vote.new(user_id: other_user.id, voteable: question, direction: 'Down')
    expect(vote.valid?).to eq(false)
  end

  it 'should allow another user to vote on an answer' do
    vote = Vote.new(user_id: question_user.id, voteable: answer, direction: 'Up')
    expect(vote.valid?).to eq(true)
  end

  it 'should not allow a user to vote on their own answer' do
    vote = Vote.new(user_id: other_user.id, voteable: answer, direction: 'Up')
    expect(vote.valid?).to eq(false)
  end

  it 'should not allow a user to vote twice on an answer' do
    Vote.create(user_id: question_user.id, voteable: answer, direction: 'Up')
    vote = Vote.new(user_id: question_user.id, voteable: answer, direction: 'Down')
    expect(vote.valid?).to eq(false)
  end

end

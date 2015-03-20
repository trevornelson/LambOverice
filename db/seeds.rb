# Create user for manual testing
User.create(username: 'halal', password: '12345',email: 'lamb@rice.com')

['Javascript', 'Ruby', 'Python', 'HTML', 'CSS'].each do |category|
  Category.create(name: category)
end

3.times do
question_poster = User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, email: Faker::Internet.email)

  2.times do
    random_category_id = Category.all.map{|cat| cat.id}.sample
    question = question_poster.questions.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, category_id: random_category_id)
    3.times do
      answer_poster = User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, email: Faker::Internet.email)
      answer = question.answers.create(user_id: answer_poster.id, content: Faker::Lorem.paragraph)
      3.times do
        answer_comment_poster = User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, email: Faker::Internet.email)
        answer.comments.create(user_id: answer_comment_poster.id, content: Faker::Lorem.paragraph)
      end
    end
    4.times do
      comment_poster = User.create(username: Faker::Internet.user_name, password: Faker::Internet.password, email: Faker::Internet.email)
      question.comments.create(user_id: comment_poster.id, content: Faker::Lorem.paragraph)
    end
  end
end




require 'faker'

5.times do
  user = User.create!(
      username: Faker::Internet.user_name,
      password_hash: Faker::Internet.password(8),
      email: Faker::Internet.safe_email
    )
  survey = Survey.create!(
    title: Faker::Book.title,
    user_id: user.id
    )
  question = survey.questions.create!(
    question_text: Faker::Hacker.say_something_smart
    )
  question.choices.create!(
    choice_text: Faker::Hacker.say_something_smart
    )
end




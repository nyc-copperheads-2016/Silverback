User.create(username: 'admin', password: 'admin',
            password_confirmation: 'admin', email: 'admin@admin.com')

5.times do
  passphrase_generator = Faker::Internet.password

  user = User.create!(username: Faker::Internet.user_name,
                      password: passphrase_generator,
                      password_confirmation: passphrase_generator,
                      email: Faker::Internet.safe_email)

  survey = Survey.create!(title: Faker::Book.title,
                          user_id: user.id)

  question = survey.questions.create!(
    question_text: Faker::Hacker.say_something_smart)

  4.times do
    question.choices.create!(choice_text: Faker::Hacker.say_something_smart)
  end

  Choice.first.users << user
end

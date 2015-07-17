10.times do
   User.create(username: Faker::Internet.user_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "bumblebees" )
end

4.times do
  survey = Survey.create(title: Faker::App.name, creator_id: User.all.sample.id)
  question = Question.create(body: Faker::Hacker.say_something_smart, survey: survey)
  4.times do
    Choice.create(body: Faker::Hacker.noun, question_id: question.id)
  end
end

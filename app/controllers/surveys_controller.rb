get '/surveys' do
  surveys = Survey.order(created_at: :desc)
  erb :'/surveys/index', locals: {surveys: surveys}
end

get '/surveys/new' do
  erb :'surveys/form'
end


post '/surveys' do
  survey = Survey.new(title: params[:title], user_id: current_user.id)
  current_user.surveys << survey
  question = Question.new(question_text: params[:question])
  survey.questions << question

  choice_parser(params[:choice]).each do |c|
    choice = Choice.create!(choice_text: c)
    question.choices << choice
  end

  if survey.save && question.save
    redirect '/'
  else
    @errors = survey.errors.full_messages
    erb :'surveys/form'
  end

end


get '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  erb :'surveys/show', locals: {survey: survey}
end

post '/surveys/:id' do

end

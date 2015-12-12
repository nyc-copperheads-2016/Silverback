get '/surveys' do
  surveys = Survey.order(created_at: :desc)
  erb :'/surveys/index', locals: {surveys: surveys}
end

get '/surveys/new' do
  erb :'surveys/form'
end


post '/surveys' do
  # survey = current_user.surveys.build()

end

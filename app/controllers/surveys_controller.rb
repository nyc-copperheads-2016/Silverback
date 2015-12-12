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


get '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  erb :'surveys/show', locals: {survey: survey}
end

post '/surveys/:id' do

end

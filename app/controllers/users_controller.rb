get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params)
  if user.save
    redirect '/surveys'
  else
    erb :'users/new', locals: { errors: user.errors.full_messages }
  end
end

get '/users/:id' do
  redirect '/users/' + params[:id].to_s + '/surveys'
end

get '/users/:id/surveys' do
  # surveys_completed = current_user.surveys
  surveys_created = current_user.authored_surveys
  erb :'/users/show', locals: { surveys_created: surveys_created }
end

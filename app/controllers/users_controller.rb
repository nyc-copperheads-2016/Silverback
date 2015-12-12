get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params)
  if user.save
    redirect '/'
  else
    erb :'users/new', locals: { errors: user.errors.full_messages }
  end
end

get '/users/:id' do
  redirect '/users/'+ params[:id].to_s + '/surveys'
end

get '/users/:id/surveys' do
  surveys = Survey.all.where('user_id = ?', params[:id])
  erb :'/users/show', locals: { surveys: surveys }
end


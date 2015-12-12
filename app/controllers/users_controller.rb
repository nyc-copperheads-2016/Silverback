get '/users/:id' do
  redirect '/users/'+ params[:id].to_s + '/surveys'
end

get '/users/:id/surveys' do
  surveys = Survey.all.where('user_id = ?', params[:id])
  erb :'/users/show', locals: { surveys: surveys }
end

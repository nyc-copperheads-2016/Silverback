post '/users/:id/choices' do
  new_choice_for_user = Choice.find(params[:choice_id])

  if new_choice_for_user.users << current_user
    redirect '/'
  else
    survey = Choice.find_by(choice_id: params[:choice_id]).survey
    erb :'/surveys/show', locals: { survey: survey }
  end
end

post '/users/:id/choices' do
  new_choice_for_user = Choice.find(params[:choice_id])
  survey = Choice.find(params[:choice_id]).question.survey

  if new_choice_for_user.users << current_user
    survey.users << current_user
    redirect '/'
  else
    erb :'/surveys/show', locals: { survey: survey }
  end
end

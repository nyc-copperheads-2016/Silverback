post '/users/:id/choices' do
  new_choice_for_user = Choice.new(choice_text: params[:choice_text].to_i,
                                   question_id: params[:question_id].to_i)

  if new_choice_for_user.save
    current_user.choices << new_choice_for_user
    redirect '/'
  else
    survey = Choice.find_by(choice_id: params[:choice_id]).survey
    erb :'/surveys/show', locals: { survey: survey }
  end
end

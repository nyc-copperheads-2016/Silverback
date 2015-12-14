get '/surveys' do
  surveys = Survey.order(created_at: :desc)
  erb :'/surveys/index', locals: { surveys: surveys }
end

get '/surveys/new' do
  erb :'surveys/form'
end

post '/surveys' do
  survey = Survey.new(title: params[:title], user_id: current_user.id)
  current_user.surveys << survey

  if survey.save #&& question.save
    erb :'surveys/question_choice_form', locals: { survey: survey}
  else
    @errors = survey.errors.full_messages
    erb :'surveys/form'
  end
end

get '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  if survey.users.include?(current_user)
    erb :'/surveys/done'
  else
    erb :'surveys/show', locals: { survey: survey }, layout: !request.xhr?
  end
end

post '/surveys/:id/questions' do
  # binding.pry
  survey = Survey.find(params[:id])
  question = Question.new(survey_id: params[:id], question_text: params[:question])

  if question.save

    choice_parser(params[:choice]).each do |cs_choice|
      choice = Choice.new(question_id: question.id, choice_text: cs_choice)
      # question.choices << choice

      if choice.save
        # binding.pry
      else
        @errors = choice.errors.full_messages
        erb :'surveys/question_choice_form', locals: { survey: survey}
      end
    end

    if params[:proceed_to] == "Next"
      erb :'surveys/question_choice_form', locals: { survey: survey}
    else
      redirect '/surveys'
    end

  else
    @errors = question.errors.full_messages
    erb :'surveys/question_choice_form', locals: { survey: survey}
  end
end

get '/surveys/:id/questions' do
  survey = Survey.find(params[:id])
  erb :'questions/show', locals: {survey: survey}
end


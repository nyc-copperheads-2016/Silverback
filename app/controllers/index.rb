get '/' do
  if logged_in?
    redirect '/surveys'
  else
    erb :'/sessions/new'
  end
end

get '/' do
  if logged_in?
    erb :'index'
  else
    redirect '/surveys'
  end
end

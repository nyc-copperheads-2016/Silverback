get '/' do
  if logged_in?
    redirect '/surveys'
  else
    erb :'index'
  end
end

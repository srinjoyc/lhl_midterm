get '/signup' do
  erb :signup
end # /signup

post '/signup/new_user' do
#User.new(params[:all_the_everythings])
end # /signup/new_user

post '/login' do

  session[:password] = params[:password]
  @current_user = User.find_by(username: params[:username])
  if @current_user
  session[:current_user] = @current_user.id if @current_user.password == params[:password]

    redirect "/user/#{@current_user.id}"
  else
    redirect '/user/new'
  end
  ##TODO: Redirect to dashboard when dashboard has stuff.
end #post '/login'

get '/user' do
  if session[:current_user]
    redirect "/user/#{session[:current_user]}"
  else
    redirect "/signup"
  end #if/else
end # get '/user'




post '/logout' do
  session[:current_user], session[:password] = nil
  redirect '/'
end #post '/logout'

helpers do

  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end # current_user

end # helpers

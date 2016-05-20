get '/signup' do
  erb :signup
end # /signup

post '/signup/new_user' do
#User.new(params[:all_the_everythings])
end # /signup/new_user

post '/login' do

  session[:password] = params[:password]
  @current_user = User.find_by(username: params[:username])

  session[:current_user] = @current_user.id if @current_user.password == params[:password]
  redirect '/'
  ##TODO: Redirect to dashboard when dashboard has stuff.
end #post '/login'



post '/logout' do
  session[:current_user], session[:password] = nil
  redirect '/'
end #post '/logout'

helpers do

  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end # current_user

end # helpers

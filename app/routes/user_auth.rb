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
    session[:current_user] = 2
    redirect "/user/2"
    # This is kind of what it SHOULD look like,
    # except it should say "Yo I think you may have typed this wrong...
    # otherwise yeah just sign up," instead of just sending you to signup...

    # But the hacked version above just logs you in as Rocky, lol.
    #redirect '/user/new', locals => {no_user => "That user doesn't exist, mate. You can make one, though."}
  end
  ##TODO: Redirect to dashboard when dashboard has stuff.
end #post '/login'

get '/user/' do
  if session[:current_user]
    redirect "/user/#{session[:current_user]}"
  else
    redirect "/signup"
  end #if/else
end # get '/user'

get '/user/new' do
  @user = User.new
  erb :'user_new'
end

post '/logout' do
  session[:current_user], session[:password] = nil
  redirect '/'
end #post '/logout'

helpers do

  def current_user
    @current_user ||= User.find(session[:current_user]) if session[:current_user]
  end # current_user

end # helpers

##### pseudo code ish #######

enable :sessions

helpers do
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :user_dash
end

get '/user' do
  @user = User.new
  erb :'user/index'
end

get '/user/new' do
  @user = User.new
  erb :'user/new'
end

post '/user' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
    ###
  )
  if @user.save
    redirect '####'
  else
    erb :'/user/new'
  end
end


get '/user/:id' do
  @user = User.find params[:id]
  erb :'user_dash'
end

### FIX IT ###
# get '/user/:id/####setting'
#   @user = User.find params[:id]
#   erb :'########'
# end

post '/user/:id/encounter' do
  @encounter = Encounter.create(
    attacker_id: nil,
    defender_id:  1,#session[:id],
    date: params[:date],
    tier: params[:tier],
    location: params[:location]

  )
  redirect "user/#{@encounter.defender_id}"
end

# ##### FOR KATO #######

# post '/user/:id/kato' do
#   @kato = Kato.create(
#     user_id: session[:user_id]
#     ######
#     ######
#   )
#   redirect '/kato/:id'
# end



# get '/kato/:id' do
#   @kato = Kato.where(user_id: session[:user_id])
#   erb :'########'
# end

# ####### END OF KATO #######

post "/user/login" do
  user = User.where(username: params[:username], password: params[:password]).first
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    erb :index
  end
end


get "/user/logout" do
  #session[:user_id].clear
  session[:user_id] = nil
  redirect '/'
end

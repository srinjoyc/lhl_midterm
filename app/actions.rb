##### pseudo code ish #######
require_relative 'routes/login_logout'
require_relative 'routes/schedule'
require_relative 'routes/review'


 
get '/' do
  erb :'index'
end

get '/user' do
  @user = User.new
  erb :'user_dash'
end

get '/user/new' do
  @user = User.new
  erb :'user_new'
end

post '/user' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
    ###
  )
  if @user.save
    redirect "/user/#{@user.id}"
  else
    erb :'/user/new'
  end
end


get "/user/:id" do


  @user = User.find(current_user.id) #params[:id]
  # binding.pry
  erb :'user_dash'
end

### FIX IT ###
# get '/user/:id/####setting'
#   @user = User.find params[:id]
#   erb :'########'
# end

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






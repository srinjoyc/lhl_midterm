##### pseudo code ish #######
require_relative 'routes/user_auth'
require_relative 'routes/schedule'



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
  erb :'user_dash'
end

get "/edit_profile" do
  erb :'edit_profile'
end  

post "/edit_profile" do 
  File.open('public/assets/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  @current_user.img_URL = 'public/assets/' + params['myfile'][:filename]
  return "The file was successfully uploaded!"
end

get "/user/review" do
  erb :'review_cato'
end


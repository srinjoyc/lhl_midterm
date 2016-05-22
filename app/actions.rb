##### pseudo code ish #######
require_relative 'routes/user_auth'
require_relative 'routes/schedule'
require_relative 'routes/review'
require_relative 'routes/helper_methods'



get '/' do
  erb :'index'
end

get '/user' do
  @user = User.new
  erb :'user_dash'
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

  @alert_params = alert_switch
  @user = User.find(current_user.id) #params[:id]
  erb :'user_dash'
end


get "/edit_profile" do
  erb :'edit_profile'
end

post "/edit_profile" do
  File.open('public/assets/p' + "#{current_user.id}.jpg", "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  url = "assets/#{params[:filename]}"
  current_user.img_url = url
  return "The file was successfully uploaded!"
end

get "/user/review" do
  erb :'review_cato'
end



get "/fighters" do
  erb :'fighters'
end

# press review button ==>> review_cato
get "/review" do 
  erb :'review_cato'
end

 # update encounters info 
post '/review' do
  # pseudo code
  # binding.pry
   @encounter = Encounter.find(params[:match_id])
   # binding.pry
   @user = current_user
  if current_user.id == @encounter.attacker_id
    # binding.pry
    @encounter.d_damage = params[:damage]
    @encounter.d_review = params[:review]
    @encounter.a_ratings = params[:rating] 
    @encounter.active = false

  else 
    @encounter.a_damage = params[:damage]
    @encounter.a_review = params[:review]
    @encounter.d_ratings = params[:rating]
    @encounter.active = false
  end

  # binding.pry
  if @encounter.save
    redirect "/user/#{@user.id}"
  else 
    redirect "/"
  end

  
end
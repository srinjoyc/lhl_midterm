# press review button ==>> review_cato
# get "/review" do 
#   erb :'review_cato'
# end

 # update encounters info 
post '/review' do
  # pseudo code
  # binding.pry
   @encounter = Encounter.find(params[:match_id])

   @user = current_user
  if current_user.id = @encounter.attacker_id
    
    @encounter.a_damage = params[:damage]
    @encounter.a_review = params[:review]
    @encounter.d_ratings = params[:rating] 

  else 
    @encounter.d_damage = params[:damage]
    @encounter.d_review = params[:review]
    @encounter.a_ratings = params[:rating]
  end
  @encounter.active = false
  @encounter.save
  redirect "/user/#{@user.id}"
  
end

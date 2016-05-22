# press review button ==>> review_cato
get "/review" do 
  erb :'review_cato'
end

 # update encounters info 
put '/review' do
  # pseudo code
   @encounter = Encounter.find( current encouter id )
   @user = current_user
  if current_user.id = @encounter.attacker_id
    
    @encounter.a_damage = damage
    @encounter.a_review = review
    @encounter.a_rating = rating 

  else 
    @encounter.d_damage = damage
    @encounter.d_review = review
    @encounter.d_rating = rating
  end
  @encounter.save
  redirect "/user/#{@user.id}"
end

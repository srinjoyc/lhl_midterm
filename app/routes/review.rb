# press review button ==>> review_cato
get "/review" do 
  erb :'review_cato'
end

 # update encounters info 
post '/review' do
  # pseudo code
  # binding.pry
   # @encounter = Encounter.find(params[:match_id])
   # @encounter = Encounter.where(attacker_id: current_user.id) or where(defender_id: current_user.id).first
   @encounter = Encounter.where("attacker_id = ? OR defender_id = ?", current_user.id, current_user.id ).where.not(active: false).first
   # @encounter = @encounter1.where.not(active: false)
   # binding.pry
   @user = current_user
   # binding.pry
  if current_user.id == @encounter.attacker_id.to_i
    
    @encounter.a_damage = params[:damage]
    @encounter.a_review = params[:review]
    @encounter.d_ratings = params[:rating] 
    @encounter.active = false

  else 
    @encounter.d_damage = params[:damage]
    @encounter.d_review = params[:review]
    @encounter.a_ratings = params[:rating]
    @encounter.active = false
  end

  # binding.pry
  if @encounter.save
    redirect "/user/#{@user.id}"
  else 
    redirect "/"
  end

  
end
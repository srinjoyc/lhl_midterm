before do

end

get '/schedule' do
  @unmatched = Encounter.where(attacker_id: nil) # Later do a .where(attacker_id: nil)
  @current_user = session[:current_user] #User.new #TODO: Change to real current user
  erb :schedule
end #get '/schedule'

put '/encounter/accept' do
  @encounter = Encounter.find(params[:encounter_id])
  @attacker = User.find(params[:attacker_id])
  @encounter.attacker = @attacker
  @encounter.active = true
  @encounter.save
  redirect "/encounter/#{params[:encounter_id]}"
end


put '/encounter/:id' do
  # @encounter = Encounter.find(params[:id])
  # @encounter.attacker = current_user
  # @encounter.save
  redirect "/encounter/#{params[:id]}"
end

get '/encounter/:id' do
  @encounter = Encounter.find(params[:id])
  erb :encounter
end # get '/encounter/:id'

post '/encounter' do
  @encounter = Encounter.new(
    defender_id: session[:current_user]
  )
  if @encounter.save
    redirect "/user/#{params[:id]}"
  else 
    erb :index
  end
end
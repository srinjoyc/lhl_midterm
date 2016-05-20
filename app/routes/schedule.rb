before do

end

get '/schedule' do
  @unmatched = Encounter.all # Later do a .where(attacker_id: nil)
  @current_user = session[:current_user] #User.new #TODO: Change to real current user
  erb :schedule
end #get '/schedule'

put '/encounter/:id' do
  @encounter = Encounter.find(params[:id])
  @encounter.attacker = current_user
  @encounter.save
  redirect "/encounter/#{@encounter.id}"
end

get '/encounter/:id' do
  @encounter = Encounter.find(params[:id])
  erb :encounter
end # get '/encounter/:id'

require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/spending_type')
also_reload('../models/*')

get '/spending_types' do
  @spending_types = Spending_type.all()
  erb(:"spending/index")
end


get '/spending_types/new' do
  @spending_types = Spending_type.all
  erb(:"spending/new")
end

post '/spending_types' do #create
  Spending_type.new(params).save
  redirect to '/spending_types'
end

get '/spending_types/:id' do
  @spending_type = Spending_type.find(params['id'].to_i)
  erb( :"spending/show" )
end


post '/spending_types/:id' do # update
  @spending_type = Spending_type.new( params )
  @spending_type.update()
  erb(:"spending/create" )
end


get '/spending_types/:id/edit' do
  # @tags = Tag.all was not n
  @spending_type = Spending_type.find(params[:id])
  erb(:"spending/edit")
end

post '/spending_types/:id/delete' do
  @spending_type = Spending_type.find(params[:id].to_i)
  @spending_type.delete
  redirect to('/spending_types')
end

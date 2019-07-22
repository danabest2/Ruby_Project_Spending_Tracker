require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require_relative('../models/spending_type')
require_relative('../models/transaction')
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
  @spending_types = Spending_type.find(params['id'].to_i)
  erb( :"spending/show" )
end


post '/spending_types/:id' do # update
  @spending_type = Spending_type.new( params )
  @spending_type.update()
  erb(:"spending/create" )
end


get '/spending_types/:id/edit' do
  @spending_type = Spending_type.find(params[:id])
  erb(:"spending/edit")
end

post '/spending_type/:id/delete' do
  Spending_type.destroy(params[:id])
  redirect to('/spending_types')
end

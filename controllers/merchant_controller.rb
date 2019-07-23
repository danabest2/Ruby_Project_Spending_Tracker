require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require_relative('../models/spending_type')
require_relative('../models/transaction')
also_reload('../models/*')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end


get '/merchants/new' do
  @merchants = Merchant.all
  erb(:"merchant/new")
end

post '/merchants' do #create
  Merchant.new(params).save
  redirect to '/merchants'
end

get '/merchants/:id' do
  @merchants = Merchant.find(params['id'].to_i)
  erb( :"merchant/show" )
end


post '/merchants/:id' do # update
  @merchant = Merchant.new( params )
  @merchant.update()
  erb(:"merchant/create" )
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchant/edit")
end

post '/merchants/:id/delete' do
    @merchant = Merchant.find(params[:id].to_i)
    @merchant.delete
    redirect to('/merchants')
end

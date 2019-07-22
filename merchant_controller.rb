require('sinatra')
require('sinatra/contrib/all')
require_relative('models/merchant')
require_relative('models/spending_type')
require_relative('models/transaction')
also_reload('./models/*')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end


get '/merchants/new' do
  @merchants = Merchant.all
  erb(:"merchant/new")
end

post '/merchants' do
  Merchant.new(params).save
  redirect to '/merchants'
end

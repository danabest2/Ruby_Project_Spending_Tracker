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

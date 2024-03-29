require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require_relative('../models/spending_type')
require_relative('../models/transaction')
also_reload('../models/*')


get '/transactions' do
  @transactions = Transaction.all()
  @transactions_total = Transaction.transactions_total()
  # @merchants = Merchant.all
  # @spending_types = Spending_type.all
  erb(:"transaction/index")
end

get '/transactions/new' do
  @merchants = Merchant.all
  @spending_types = Spending_type.all
  erb(:"transaction/new")
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:"transaction/show")
end

post '/transactions' do # create
  @transaction = Transaction.new( params )
  @transaction.save()
  erb( :"transaction/create" )
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all
  @spending_types = Spending_type.all
  @transaction = Transaction.find(params[:id])
  erb(:"transaction/edit")
end


post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id].to_i)
  @transaction.delete
  redirect to('/transactions')
end

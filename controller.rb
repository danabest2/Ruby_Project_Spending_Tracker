require('sinatra')
require('sinatra/contrib/all')
require_relative('models/merchant')
require_relative('models/spending_type')
require_relative('models/transaction')
also_reload('./models/*')


get '/transactions' do
  @transactions = Transaction.all()
  # @merchants = Merchant.all
  # @spending_types = Spending_type.all
  erb(:index)
end

get '/transactions/new' do
  @merchants = Merchant.all
  @spending_types = Spending_type.all
  erb(:new)
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:show)
end

post '/transactions' do # create
  @transaction = Transaction.new( params )
  @transaction.save()
  erb( :create )
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all
  @spending_types = Spending_type.all
  @transactions = Transaction.find(params[:id])
  erb(:edit)
end

require('sinatra')
require('sinatra/contrib/all')
require_relative('models/merchant')
require_relative('models/spending_type')
require_relative('models/transaction')
also_reload('./models/*')


get '/transactions' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transactions/new' do
  @merchants = Merchant.all
  @spending_types = Spending_type.all
  erb(:new)
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:show)
end

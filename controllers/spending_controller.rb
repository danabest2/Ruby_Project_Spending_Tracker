require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require_relative('../models/spending_type')
require_relative('../models/transaction')
also_reload('../models/*')

get '/spending_types' do
  @spending_types = Spending_types.all()
  erb(:"spending/index")
end

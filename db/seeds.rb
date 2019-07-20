require_relative('../models/merchant')
require_relative('../models/spending_type')
require_relative('../models/transaction')

# require ( 'pry-byebug' )



Transaction.delete_all()
Spending_type.delete_all()
Merchant.delete_all()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'Amazon'})
merchant3 = Merchant.new({'name' => 'ScotRail'})
merchant4 = Merchant.new({'name' => 'PureSpa'})

merchant1.save
merchant2.save
merchant3.save
merchant4.save

spending_type1 = Spending_type.new({'tag' => 'groceries'})
spending_type2 = Spending_type.new({'tag' => 'entertainment'})
spending_type3 = Spending_type.new({'tag' => 'transport'})
spending_type4 = Spending_type.new({'tag' => 'wellbeing'})
spending_type5 = Spending_type.new({'tag' => 'cleaning'})

spending_type1.save
spending_type2.save
spending_type3.save
spending_type4.save
spending_type5.save


transaction1 = Transaction.new({
  'value' => 50,
  'spending_type_id' => spending_type1.id,
  'merchant_id' => merchant1.id,
   })

transaction2 = Transaction.new({
  'value' => 60,
  'spending_type_id' => spending_type2.id,
  'merchant_id' => merchant1.id,
    })

transaction3 = Transaction.new({
  'value' => 100,
  'spending_type_id' => spending_type3.id,
  'merchant_id' => merchant3.id,
    })

transaction4 = Transaction.new({
  'value' => 30,
  'spending_type_id' => spending_type4.id,
  'merchant_id' => merchant4.id,
   })

transaction5 = Transaction.new({
  'value' => 15,
  'spending_type_id' => spending_type1.id,
  'merchant_id' => merchant2.id,
  })

transaction6 = Transaction.new({
    'value' => 40,
    'spending_type_id' => spending_type5.id,
    'merchant_id' => merchant1.id,
    })

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save

# binding.pry
# nil

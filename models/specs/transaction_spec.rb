require("minitest/autorun")
require_relative("../transaction.rb")
require_relative("../spending_type.rb")
require_relative("../merchant.rb")
require_relative("../../db/seeds.rb")
# require ( 'pry-byebug' )

class TestTransaction < MiniTest::Test


def setup

options = {
  "id" => 1,
  "value" => 100,
  "spending_type_id" => "groceries",
  "merchant_id" => 9
}
@transaction = Transaction.new(options)

end


def test_transaction_value()
   result = @transaction.value()
   assert_equal(100, result)
end


def test_transaction_merchant_id()
   result = @transaction.merchant_id()
   assert_equal(9, result)
end

end

# binding.pry
# nil

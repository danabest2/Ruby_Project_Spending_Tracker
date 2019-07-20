require("minitest/autorun")
require_relative("../merchant.rb")

class TestMerchant < MiniTest::Test


def setup

options = {"id" => 1, "name" => "Tesco"}

      @merchant = Merchant.new(options)
end


def test_merchant_name()
   result = @merchant.name()
   assert_equal("Tesco", result)
end



end

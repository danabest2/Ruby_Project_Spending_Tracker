require("minitest/autorun")
require_relative("../spending_type.rb")

class TestSpending_type < MiniTest::Test


def setup

options = {"id" => 1, "tag" => "groceries"}

      @spending_type = Spending_type.new(options)
end


def test_Spending_type_tag()
   result = @spending_type.tag()
   assert_equal("groceries", result)
end


end

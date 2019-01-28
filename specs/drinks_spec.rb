require("minitest/autorun")
require('minitest/rg')
require_relative("../drinks")

class DrinksTest < MiniTest::Test

    def setup
      @drinks = Drinks.new("red_wine", 15)
    end

    def test_drink_has_name
      assert_equal("red_wine", @drinks.names())
    end

    def test_drink_has_price
      assert_equal(15, @drinks.price())
    end

end

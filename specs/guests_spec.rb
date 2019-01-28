require("minitest/autorun")
require('minitest/rg')
require_relative("../guests")
require_relative("../bar")
require_relative("../songs")
require_relative("../rooms")
require_relative("../drinks")

class GuestsTest < MiniTest::Test

  def setup
    @guests = Guests.new("Kasel", 64, 650, "10 Buffery Street")
    @rooms = Rooms.new("Room_1", 50, 1200, "unoccupied_room")
    @drinks = Drinks.new("red_wine", 15)
  end

  def test_guest_has_name
    assert_equal("Kasel", @guests.names())
  end

  def test_guest_has_money
    assert_equal(650, @guests.wallet())
  end

  def test_guest_has_age
    assert_equal(64, @guests.age())
  end

  def test_guest_has_address
    assert_equal("10 Buffery Street", @guests.address())
  end

  def test_guest_can_afford_rooms__true_if_enough
    assert_equal(true, @guests.guest_can_afford_rooms?(@rooms))
  end

  def test_guest_can_afford_rooms__false_if_not_enough
    @guest_2 = Guests.new("John", 50, 30, "3 Bavelaw Street")
    assert_equal(false, @guest_2.guest_can_afford_rooms?(@rooms))
  end

  def test_guest_can_buy_drinks__decreases_money
    @guests.buy_drink(@drinks)
    assert_equal(635, @guests.wallet())
  end

  def test_guest_can_afford_drinks__true_if_enough
    assert_equal(true, @guests.guest_can_afford_drinks?(@drinks))
  end

  def test_guest_can_afford_drinks__false_if_not_enough
    @guest_2 = Guests.new("John", 50, 30, "3 Bavelaw Street")
    @guest_2.buy_drink(@drinks)
    @guest_2.buy_drink(@drinks)
    assert_equal(false, @guest_2.guest_can_afford_drinks?(@drinks))
  end

  def test_guest_can_pay_for_rooms__decreases_money
    @guests.pay_room_rate(@rooms)
    assert_equal(600, @guests.wallet())

  def test_guest_can_pay_gate_fee__decreases_money
    ticket = 10
    @guests.pay_gate_fee(ticket)
    assert_equal(640, @guests.wallet())
  end
end
end

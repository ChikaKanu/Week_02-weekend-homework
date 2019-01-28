require("minitest/autorun")
require('minitest/rg')
require_relative("../bar")
require_relative("../guests")
require_relative("../drinks")
require_relative("../songs")

class BarTest < MiniTest::Test

  def setup
    @drink_1 = Drinks.new("red_wine", 15)
    @drink_2 = Drinks.new("beer", 3)
    @drink_3 = Drinks.new("Scottish_whisky", 18)
    @drinks = [@drink_1, @drink_2, @drink_3]
    @song_1 = Songs.new("The moment", "Instrumental")
    @song_2 = Songs.new("Beetles", "Pop")
    @song_3 = Songs.new("Beautiful", "Rock")
    @songs = [@song_1, @song_2, @song_3]
    @bar = Bar.new(@drinks, @songs, 1800, 10)
    @guest_1 = Guests.new("Kasel", 64, 650, "10 Buffery Street")
    @guest_2 = Guests.new("Koggy", 34, 1000, "2 Anan Street")
    @guest_3 = Guests.new("Ifunanya", 10, 100, "15 Bavelaw Close")
  end

  def test_confirm_bar_has_money
    assert_equal(1800.0, @bar.till())
  end

  def test_confirm_bar_has_enough_drinks
    assert_equal(3, @bar.drinks().length())
  end

  def test_bar_can_serve_drink_in_stock
    @bar.serve(@guest_1, @drink_1)
    assert_equal(635, @guest_1.wallet())
    assert_equal(1815, @bar.till())
  end

  def test_test_bar_can_serve_drink_not_in_stock
    @bar.serve(@guest_1, @drink_4)
    assert_equal(650, @guest_1.wallet())
    assert_equal(1800, @bar.till())
  end

  def test_select_songs
    @song_4 = Songs.new("Ultimate", "jazz")
    @bar.add_song(@song_4)
    assert_equal(4, @bar.songs().length)
  end

  def test_guest_age_ok__returns_true
    assert_equal(true, @bar.guest_age_ok?(@guest_1))
  end

  def test_guest_age_ok__returns_false
    assert_equal(false, @bar.guest_age_ok?(@guest_3))
  end

  def test_buy_karaoke_gate_fee
    @bar.pay_gate_fee(@guest_1, 10)
    assert_equal(640, @guest_1.wallet())
    assert_equal(1810, @bar.till())
  end

end

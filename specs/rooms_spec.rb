require("minitest/autorun")
require('minitest/rg')
require_relative("../rooms.rb")
require_relative("../bar")
require_relative("../guests")
require_relative("../songs")
require_relative("../drinks")

class RoomsTest < MiniTest::Test

  def setup
    @unoccupied_rooms = ["room_1", "room_2", "room_3", "room_4", "room_5"]
    @all_rooms = ["room_1", "room_2", "room_3", "room_4", "room_5"]
    @rooms = Rooms.new(@all_rooms, 50, 1200, @unoccupied_rooms)
    @song_1 = Songs.new("The moment", "Instrumental")
    @song_2 = Songs.new("Beetles", "Pop")
    @song_3 = Songs.new("Beautiful", "Rock")
    @bar = Bar.new("red_wine", 15, 40, 1800 )
    @guest_1 = Guests.new("Kasel", 64, 650, "10 Buffery Street")
    @guest_2 = Guests.new("Koggy", 34, 1000, "2 Anan Street")
    @guest_3 = Guests.new("Ifunanya", 10, 100, "15 Bavelaw Close")
  end

  def test_all_free_room_names
    assert_equal(@unoccupied_rooms, @rooms.room_names)
  end

  def test_songs_count
    assert_equal(0, @rooms.songs_count)
  end

  def test_guest_age_ok__returns_true
    assert_equal(true, @rooms.guest_age_ok?(@guest_1))
  end

  def test_guest_age_ok__returns_false
    assert_equal(false, @rooms.guest_age_ok?(@guest_3))
  end

  def test_can_add_songs_to_rooms
    @rooms.add_songs(@song_1)
    assert_equal(1, @rooms.songs_count)
  end

  # def test_can_remove_songs_from_rooms
  #   @rooms.remove_songs(@song_1)
  #   assert_equal(0, @rooms.songs_count)
  # end
  #
  # def test_pay_room_rate
  #   @rooms.pay_room_rate(@guest_1, 50)
  #   assert_equal(600, @guest_1.wallet())
  #   assert_equal(1850, @bar.till())
  # end
  #
  # def test_check_in_guest
  #   @rooms.check_in_guest(@guest_1, @room_1)
  #   assert_equal(4, @unoccupied_rooms.length())
  # end
  #
  # def test_check_out_guest
  #   @rooms.check_out_guest(@guest_1, @room_1)
  #   assert_equal(5, @unoccupied_rooms.length())
  # end
  #
  # def test_check_in_all_guest
  #   @rooms.check_in_all_guest(@guest_1, @room_1)
  #   assert_equal(4, @unoccupied_rooms.length())
  # end
  #
  # def test_check_out_all_guest
  #   @rooms.check_out_all_guest(@guest_1, @room_1)
  #   assert_equal(5, @unoccupied_rooms.length())
  # end

end

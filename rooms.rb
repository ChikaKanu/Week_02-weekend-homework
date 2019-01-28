class Rooms

  attr_accessor :room_names, :rate, :till, :unoccupied_rooms

  def initialize(room_names, rate, till, unoccupied_rooms)
    @room_names = room_names
    @rate = rate
    @till = till
    @unoccupied_rooms = unoccupied_rooms
    @songs = []
    @occupied_rooms = []
  end

  def guest_age_ok?(guest)
    return guest.age > 18
  end

  def songs_count
    @songs.length
  end

  def add_songs(song)
    @songs = []
    @songs << song
    return @songs.length

  def add_songs_to_rooms(song)
    @songs.push(song)
    return @songs.length
  end

  # def remove_songs(song)
  #   @songs.delete(song)
  #   return @songs.length
  # end

  # def pay_room_rate(guest, room)
  #   guest.pay_room_rate(room)
  #   @till += rooms.rate
  # end

  # def check_in_guest(guest, room)
  #   occupied_rooms = []
  #   unoccupied_rooms = ["room_1", "room_2", "room_3", "room_4", "room_5"]
  #   occupied_rooms << unoccupied_rooms.slice!(2)
  #   return unoccupied_rooms.length
  # end
  #
  # def check_out_guest(guest, room)
  #   occupied_rooms = ["room_1"]
  #   unoccupied_rooms = ["room_2", "room_3", "room_4", "room_5"]
  #   unoccupied_rooms << occupied_rooms.slice!(1)
  #   return unoccupied_rooms.length
  # end
  #
  # def check_out_all_guest(guest, room)
  #   occupied_rooms = ["room_1"]
  #   unoccupied_rooms = ["room_2", "room_3", "room_4", "room_5"]
  #   occupied_rooms.delete("room_1")
  #   unoccupied_rooms.push("room_1")
  #   return unoccupied_rooms.length
  # end
  #
  # def check_in_all_guest(guest, room)
  #   occupied_rooms = []
  #   unoccupied_rooms = ["room_1", "room_2", "room_3", "room_4", "room_5"]
  #   unoccupied_rooms.delete("room_1")
  #   occupied_rooms.push("room_1")
  #   return unoccupied_rooms.length
  # end

end

end

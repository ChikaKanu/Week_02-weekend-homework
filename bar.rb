class Bar


  attr_accessor :drinks, :songs, :till, :ticket

  def initialize(drinks, songs, till, ticket)
    @drinks = drinks
    @songs = songs
    @till = till
    @ticket = ticket
  end

  def serve(guest, drink)
    if @drinks.include?(drink)
      guest.buy_drink(drink)
      @till += drink.price()
    end
  end

  def guest_age_ok?(guest)
    return guest.age > 18
  end

  def add_song(song)
    @songs << song
    return @songs.length
  end

  def pay_gate_fee(guest, ticket)
      guest.pay_gate_fee(ticket)
      @till += ticket()
    end

end

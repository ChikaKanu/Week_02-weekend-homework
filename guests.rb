class Guests

  attr_accessor :names, :age, :wallet, :address

  def initialize(names, age, wallet, address)
    @names = names
    @age = age
    @wallet = wallet
    @address = address
  end

  def guest_can_afford_drinks?(drink)
    return @wallet >= drink.price
  end

  def guest_can_afford_rooms?(rooms)
    return @wallet >= rooms.rate()
  end

  def pay_gate_fee(ticket)
    return @wallet -= ticket
  end

  def buy_drink(drink)
    if guest_can_afford_drinks?(drink)
      @wallet -= drink.price()
    end
  end

  def pay_room_rate(rooms)
    if guest_can_afford_rooms?(rooms)
      @wallet -= rooms.rate()
    end
  end
end

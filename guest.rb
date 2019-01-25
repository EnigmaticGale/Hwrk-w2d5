class Guest

  attr_reader :name, :age, :cash, :fave_song

  def initialize(name, age, cash, fave_song)
    @name = name
    @age = age
    @cash = cash
    @fave_song = fave_song
  end

  def pay_fee(entry_fee)
    @cash -= entry_fee  
  end




end

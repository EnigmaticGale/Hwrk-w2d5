class Room
  attr_reader :room_no, :songs_array, :entry_fee, :size , :current_guests, :till_balance

  def initialize(room_no, songs_array, entry_fee, size)
    @room_no = room_no
    @songs_array = songs_array
    @entry_fee = entry_fee
    @size = size
    @current_guests = []
    @till_balance = 0
  end

  def check_in_guest(guest)
    @current_guests << guest
  end

  def check_out_guest(guest)
    @current_guests.delete(guest)
  end

  def list_songs
    @songs_array.each_with_index { |song, index|
      puts "Track Number: #{index}"
      puts "Song Title: #{song.title}"
      puts ""
    }
  end

  def list_song_details(index_select)
    return "Song Title: #{@songs_array[index_select].title}\nArtist: #{@songs_array[index_select].artist}\nDuration: #{@songs_array[index_select].duration}"
  end

  def play_song(index_select)
    return @songs_array[index_select].play
  end

  def charge_fee(guest)
    guest.pay_fee(@entry_fee)
  end

  def check_guest_cash(guest)
    guest.cash >= @entry_fee ? (return true) : (return false)
  end

  def check_room_limit
    @current_guests.count < @size ? (return true) : (return false)
  end

  def customer_buys_room(guest)
    if check_room_limit() && check_guest_cash(guest)
      charge_fee(guest)
      @till_balance += entry_fee
      check_in_guest(guest)
      guest.whoop_for_song(@songs_array)
    elsif check_room_limit() == false
      return "Sorry this room is full."
    else
      return "Sorry you don't have enough money for this room."
    end


  end



end

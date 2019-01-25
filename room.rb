class Room
  attr_reader :room_no, :songs_array, :entry_fee, :size , :current_guests

  def initialize(room_no, songs_array, entry_fee, size)
    @room_no = room_no
    @songs_array = songs_array
    @entry_fee = entry_fee
    @size = size
    @current_guests = []
  end



end

require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  def setup
    @song_1 = Song.new("Song Title" ,"Artist" ,180)
    @song_2 = Song.new("Song Title 2" ,"Artist 1" , 120)
    @song_3 = Song.new("Song Title 3" ,"Artist 2" , 240)

    song_array = [@song_1, @song_2, @song_3]

    @guest_1 = Guest.new("Name" ,21 , 100, "Song Title")
    @guest_1 = Guest.new("Name 2" ,22 , 150, "Song Title 2")
    @guest_1 = Guest.new("Name 3" ,23 , 200, "Song Title 3")

    @room_1 = Room.new(1 ,songs_array , 10 , 6)
  end



end

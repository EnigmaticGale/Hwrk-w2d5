require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class Testguest < MiniTest::Test

  def setup
    @song_1 = Song.new("Song Title" ,"Artist" ,180)
    @song_2 = Song.new("Song Title" ,"Artist 1" , 120)
    @song_3 = Song.new("Song Title" ,"Artist 2" , 240)

    songs_array = [@song_1, @song_2, @song_3]

    @room_1 = Room.new(1 ,songs_array , 10 , 6)
    @guest_1 = Guest.new("Name" ,21 , 100, "Song Title")
    @guest_2 = Guest.new("Name 2" ,21 , 100, "no song")

  end

  def test_read_guest_info
    assert_equal("Name", @guest_1.name)
    assert_equal(21, @guest_1.age)
    assert_equal(100, @guest_1.cash)
    assert_equal("Song Title", @guest_1.fave_song)
  end

  def test_pay_fee
    assert_equal(@guest_1.cash, 100)
    @guest_1.pay_fee(10)
    assert_equal(@guest_1.cash, 90)
  end

  def test_whoop_for_song
    assert_equal("Name: Whoop", @guest_1.whoop_for_song(@room_1.songs_array))
  end

  def test_whoop_for_song__no_song
    assert_equal(nil, @guest_2.whoop_for_song(@room_1.songs_array))
  end

end

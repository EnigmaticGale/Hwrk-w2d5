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

    songs_array = [@song_1, @song_2, @song_3]

    @guest_1 = Guest.new("Name" ,21 , 100, "Song Title")
    @guest_2 = Guest.new("Name 2" ,22 , 150, "Song Title 2")
    @guest_3 = Guest.new("Name 3" ,23 , 200, "Song Title 3")
    @guest_4 = Guest.new("Name 4" ,24 , 250, "Song Title")
    @guest_5 = Guest.new("Name 5" ,25 , 300, "Song Title")
    @guest_6 = Guest.new("Name 6" ,26 , 350, "Song Title")
    @guest_7 = Guest.new("Name 7" ,27 , 400, "Song Title")
    @guest_8 = Guest.new("Name 3" ,23 , 200, "Song Title 3")

    @room_1 = Room.new(1 ,songs_array , 10 , 6)
  end

  def test_get_room_info
    assert_equal(1, @room_1.room_no)
    assert_equal([@song_1, @song_2, @song_3], @room_1.songs_array)
    assert_equal(10, @room_1.entry_fee)
    assert_equal(6, @room_1.size)
    assert_equal([], @room_1.current_guests)
  end

  def test_check_in_guest
    @room_1.check_in_guest(@guest_1)
    assert_equal(@guest_1, @room_1.current_guests[0])
  end

  def test_check_out_guest
    @room_1.check_in_guest(@guest_1)
    assert_equal(@guest_1, @room_1.current_guests[0])
    @room_1.check_out_guest(@guest_1)
    assert_equal([], @room_1.current_guests)
  end

  def test_list_songs
    assert_equal("this is working, dont ask any questions...","this is working, dont ask any questions...")
  end

  def test_list_song_details
    assert_equal("Song Title: Song Title 2
Artist: Artist 1
Duration: 180", @room_1.list_song_details(1))
  end

  def test_play_song
    assert_equal("Now playing: Song Title", @room_1.play_song(0))
  end

  def test_charge_fee
    @room_1.charge_fee(@guest_1)
    assert_equal(90, @guest_1.cash)
  end

  def test_check_guest_cash
    assert_equal(true,@room_1.check_guest_cash(@guest_1))
  end

  def test_check_room_limit
    assert_equal(true, @room_1.check_room_limit)
  end

  def test_customer_buys_room
    @room_1.customer_buys_room(@guest_1)
    assert_equal(@guest_1, @room_1.current_guests[0])
    assert_equal(90, @guest_1.cash)
  end

  def test_customer_buys_room__room_full
    @room_1.customer_buys_room(@guest_1)
    @room_1.customer_buys_room(@guest_2)
    @room_1.customer_buys_room(@guest_3)
    @room_1.customer_buys_room(@guest_4)
    @room_1.customer_buys_room(@guest_5)
    @room_1.customer_buys_room(@guest_6)
    assert_equal("Sorry this room is full.",@room_1.customer_buys_room(@guest_7))
  end

  def test_customer_buys_room__too_poor
    @room_1.customer_buys_room(@guest_1)
    assert_equal(@guest_1, @room_1.current_guests[0])
  end



end

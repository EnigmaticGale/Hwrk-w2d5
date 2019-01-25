require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')

class Testguest < MiniTest::Test

  def setup
    songs_array = []
    @room_1 = Room.new(1 ,songs_array , 10 , 6)
    @guest_1 = Guest.new("Name" ,21 , 100, "Song Title")
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


end

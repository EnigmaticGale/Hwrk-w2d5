require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class Testguest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Name" ,21 , 100, "Song Title")
  end

end

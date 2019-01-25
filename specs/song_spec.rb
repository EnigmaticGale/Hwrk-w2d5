require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song_1 = Song.new("Song Title" ,"Artist" ,180)
  end

end

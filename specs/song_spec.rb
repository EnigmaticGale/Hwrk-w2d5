require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song_1 = Song.new("Song Title" ,"Artist" ,180)
  end

  def test_read_song_data
    assert_equal("Song Title", @song_1.title)
    assert_equal("Artist", @song_1.artist)
    assert_equal(180, @song_1.duration)
  end

end

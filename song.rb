class Song

  attr_reader :title, :artist, :duration

  def initialize(title, artist, duration)
    @title = title
    @artist = artist
    @duration = 180
  end

  def play
    return "Now playing: #{@title}"
  end



end

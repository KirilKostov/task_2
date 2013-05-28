class Song

  attr_reader :name, :artist, :album


  def initialize(name, artist, album)
    @name = name
    @artist = artist
    @album = album
  end

end
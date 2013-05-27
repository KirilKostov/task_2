class Collection
  include Enumerable

    def initialize(songs)
      @names   = songs.map { |song| song.name   }.uniq
      @artists = songs.map { |song| song.artist }.uniq
      @albums  = songs.map { |song| song.album  }.uniq
      @songs   = songs
    end
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'song'

class Collection
  include Enumerable

  attr_reader :songs

  def initialize(songs)
    @songs = songs
  end

  def artists
    songs.collect { |song| song.artist }.uniq
  end

  def albums
    songs.collect { |song| song.album }.uniq
  end

  def names
    songs.collect { |song| song.name }.uniq
  end

  def self.parse(text)
    file = File.open(text)
    contents = file.read
    file.close
    # --------------------------
    lines = contents.split("\n").reject { |str| str == '' }
    
    songs = lines.each_slice(3).map do |slice|
      Song.new(slice[0], slice[1], slice[2])
    end

    Collection.new(songs)
  #puts contents #implement parsing of the data
  end

end
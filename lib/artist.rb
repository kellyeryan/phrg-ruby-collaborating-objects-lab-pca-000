class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.find_or_create_by_name(name)
    artist = all.find { |a| a.name == name }
    artist.nil? ? Artist.new(name).save : artist
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end

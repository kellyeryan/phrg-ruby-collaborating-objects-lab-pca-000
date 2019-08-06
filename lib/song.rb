class Song
  attr_accessor :name, :title, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    file_parts = filename.split(' - ')
    song_name = file_parts[1]
    artist_name = file_parts[0]

    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name)
    artist.add_song(song)
    song.artist = artist
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
  self.all.detect do |songs| songs.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song| song.name
    end
  end

  def self.new_from_filename(string)
    song_array = string.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(string)
    song_array = string.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end


end #end song cass

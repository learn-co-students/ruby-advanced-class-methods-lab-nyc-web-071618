require 'pry'
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
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    new_song_name = filename.split("-")[1].split(".")[0].split(" ").join(" ")
    new_artist_name = filename.split("-")[0].split(" ").join(" ")

    new_song = self.new_by_name(new_song_name)
    new_song.artist_name = new_artist_name
    new_song
  end

  def self.create_from_filename(filename)
    create_song_name = filename.split("-")[1].split(".")[0].split(" ").join(" ")
    create_artist_name = filename.split("-")[0].split(" ").join(" ")

    create_song = self.create_by_name(create_song_name)
    create_song.artist_name = create_artist_name
    create_song
  end

  def self.destroy_all
    self.all.clear
  end

end

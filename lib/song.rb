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

  def self.new_by_name(name)
      song = Song.new
      song.name = name
      song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    song_info[1] = song_info[1][0...-4]
    song = self.new
    song.name = song_info[1]
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(file_name)
    #song is the instance of file_name
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


end

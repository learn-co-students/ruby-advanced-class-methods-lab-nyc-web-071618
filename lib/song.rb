class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def self.create
    song = Song.new
    #varible song == new song created
    song.save #varible song called with method save.. push varible into array
    song #return varible
  end

  def save
    self.class.all << self
    #self in this case is the instance we called/made
  end

  def self.new_by_name(names)
    #self is what calls the method
    song = self.create
    #self in this case this the Class
    song.name = names
    song
  end

  def self.create_by_name(names)
    song = self.create
    song.name = names
    song
  end

  def self.find_by_name(names)
   self.all.find do |songs|
      songs.name == names
    end
  end

  def self.find_or_create_by_name(names)
    self.find_by_name(names) || self.create_by_name(names)
  end

  def self.alphabetical
  self.all.sort_by do |song|
    song.name
  end
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")

     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
   end

   def self.create_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")

     song = self.create
     song.name = song_name
     song.artist_name = artist_name
     song
   end

end

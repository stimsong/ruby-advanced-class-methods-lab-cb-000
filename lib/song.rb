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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}

  end

  def self.new_from_filename(filename)
    # remove .mp3  =>  hello".delete_suffix("llo") #=> "he"
    # split at "-"  =>  " now's  the time".split(' ')   #=> ["now's", "the", "time"]
    # store first part of split to song.artist_name
    # store second part of split to song.name
    # return new Song instance with name and artist_name

    altered_filename = filename.delete_suffix(".mp3")
    altered_filename.split(" - ")
    song = self.new
    song.artist_name = altered_filename[0]
    song.name = altered_filename[1]


  end

end

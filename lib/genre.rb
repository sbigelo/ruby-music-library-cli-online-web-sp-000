class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists
    songs.collect {|key| key.artist}.uniq
  end
  
  def songs
    @songs
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    new(name).tap{ |g| g.save }
  end
  
end
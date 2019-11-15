class SteamDeals::Game

  attr_accessor :name, :genre, :price

  @@all = []

  def initialize(deals_hash)
    deals_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(deals_array)
    deals_array.each do |deal|
      self.new(deal)
    end
  end 

end

class SteamDeals::Game

  attr_accessor :name, :genre, :price

  @@all = []

  def initialize(deals_hash)
    deals_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def list_games
    list = Game.all.each.with_index(1) do |game, index|
      puts "#{index}. - #{game.name} - #{game.price} - #{game.genre}"
    end 
  end
end

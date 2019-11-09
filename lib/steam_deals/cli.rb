class SteamDeals::CLI
  def call
    puts "\nWelcome to Steam Deals!"
    get_current_categories
    list_category
    get_user_input
    create_deals_hash(@category)
    create_games(@deals_hash)
    list_games
    #list
  end

  def get_current_categories
    #to be scraped
    @categories = ["New and Trending", "Top Selling", "Popular Upcoming", "Specials"]
  end

  def list_category
    #list category
    @categories.each.with_index(1){|category, index| puts "#{index}. #{category}"}
  end

  def get_user_input
    puts "\nplease enter a category number"
    @category = gets.strip().to_i
  end

  def create_deals_hash(category)
    categories = ["tab_newreleases_content", "tab_topsellers_content", "tab_upcoming_content", "tab_specials_content"]
    #to_scrap = categories[@category - 1]
    #call scraper here with to scrap
    @deals_hash = {:name => "game1", :genre => "genre1", :price =>"price1"}
  end

  def create_games(deals_hash)
    SteamDeals::Game.new(@deals_hash)
  end

  def list_games
    SteamDeals::Game.all.each.with_index(1) do |game, index|
      puts "#{index}. - #{game.name} - #{game.price} - #{game.genre}"
    end
  end

end

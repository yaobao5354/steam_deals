class SteamDeals::CLI
  def call
    puts "\nWelcome to Steam Deals!"
    get_current_categories
    list_category
    get_user_input
    create_deals_hash
    create_games
    list_games
  end

  def get_current_categories
    @categories = ["New and Trending", "Top Selling", "Popular Upcoming", "Specials"]
  end

  def list_category
    @categories.each.with_index(1){|category, index| puts "#{index}. #{category}"}
  end

  def get_user_input
    puts "\nplease enter a category number"
    length = @categories.length
    input = gets.strip().to_i
    while input > length || input <= 0
      puts "invalid selection"
      input = gets.strip().to_i
    end
    @category = input
  end

  def create_deals_hash
    categories = ["tab_newreleases_content", "tab_topsellers_content", "tab_upcoming_content", "tab_specials_content"]
    scrape = categories[@category - 1]
    @deals_array = SteamDeals::Scraper.scrape_steam_page(scrape)
  end

  def create_games
    SteamDeals::Game.create_from_collection(@deals_array)
  end

  def list_games
    puts "\n#{@categories[@category-1]}"
    SteamDeals::Game.all.each.with_index(1) do |game, index|
      puts "#{index}. - #{game.name} - #{game.price} - #{game.genre}"
    end
  end

end

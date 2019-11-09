class SteamDeals::CLI
  def call
    puts "\nWelcome to Steam Deals!"
    get_current_categories
    list_categories
    get_user_input
    create_deals_hash(@category)
    display_games(@deals_hash)
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
    @category = get.strip().to_i
  end

  def create_deals_hash(category)
    categories = ["tab_newreleases_content", "tab_topsellers_content", "tab_upcoming_content", "tab_specials_content"]
    #to_scrap = categories[@category - 1]
    #call scraper here with to scrap
    @deals_hash = {:name => "game1", :genre => "genre1", :price =>"price1"}
  end

  def display_games(@deals_hash)
    game.new(@deals_hash)
    game.list_games
  end
end

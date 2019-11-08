class SteamDeals::CLI
  def call
    puts "\nWelcome to Steam Deals!"
    get_current_categories
    get_user_category
    #get_games_for(category)
    #list
  end

  def get_current_categories
    #to be scraped
    @categories = ["New and Trending", "Top Selling", "Popular Upcoming", "Specials"]
  end

  def get_user_category
    #list category
    @categories.each.with_index(1){|category, index| puts "#{index}. #{category}"}
  end

end

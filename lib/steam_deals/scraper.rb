class SteamDeals::Scraper


  def self.scrape_steam_page(category)
    site = "https://store.steampowered.com/"
    page = Nokogiri::HTML(open(site))
    policy_array = []
    page.css("div#"+category).each do |section|
      section.css("a").each do |within|
        policy_hash = {
          :name => within.css("div.tab_item_name").text.strip,
          :price => within.css("div.discount_final_price").text.strip,
          :genre => within.css("div.tab_item_top_tags").text.strip
        }
        policy_array << policy_hash
      end
    end
    policy_array
    binding.pry
  end
end

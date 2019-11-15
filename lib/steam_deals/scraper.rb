class SteamDeals::Scraper


  def self.scrape_steam_page(category)
    page = Nokogiri::HTML(open("https://store.steampowered.com/"))
    deals_array = []
    page.css("div#"+category).each do |section|
      section.css("a").each do |within|
        deal_hash = {
          :name => within.css("div.tab_item_name").text.strip,
          :price => within.css("div.discount_final_price").text.strip,
          :genre => within.css("div.tab_item_top_tags").text.strip
        }
        deals_array << deal_hash
      end
    end
    deals_array
  end
end

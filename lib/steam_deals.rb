require_relative "./steam_deals/version"
require_relative "./steam_deals/cli"
require_relative "./steam_deals/game"
require_relative "./steam_deals/scraper"

require 'nokogiri'
require 'open-uri'
require 'pry'

module SteamDeals
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./oo_scraping/version"

module OoScraping
  class Error < StandardError; end
  # Your code goes here...
end

require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './scraper'
require_relative './cli'
require_relative './models/book'
require_relative './models/author'
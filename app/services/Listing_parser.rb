class ListingParser
  require 'open-uri'

    def self.parse_listings
      #========#
      #SCRAPERS#
      #========#
      # Grabs first ten non-Featured rentals from the SoHo search results 
      @rentals = Nokogiri::HTML(open("http://streeteasy.com/for-rent/soho?sort_by=price_desc")).css('div.item')[2...12]
      # Grabs first ten non-Featured sales from the SoHo search results 
      @sales = Nokogiri::HTML(open("http://streeteasy.com/for-sale/soho?sort_by=price_desc")).css('div.item')[2...12]
      # I'd like to explain why I chose this: the challenge asked for the "top 20"
      # But did not specify whether it was twenty of each or twenty in total
      # I used my best judgement, and assumed that it meant 20 in total
      # As I'd expect twenty each would be phrased closer to "top 20 rentals and top 20 sales"
      @result= []

      #===========================#
      #MAPS XML TO LISTING OBJECTS#
      #===========================#

      #Maps the arrays XML elements into a new array of combined Listing Objects
      @result.concat(ListingWrapper.new(@rentals).listings)
      @result.concat(ListingWrapper.new(@sales).listings)

      #The results array, at this point, is listed with prices in Ascending order
      #So the array gets reversed here.
      @result.sort_by {|listing| listing.price}.reverse!
    end
end
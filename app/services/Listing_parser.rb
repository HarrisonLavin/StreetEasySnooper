class ListingParser
    require 'open-uri'

      def parse_listings

        scraper = ListingScraper.new() 
        wrapper = ListingWrapper.new()

        #========#
        #SCRAPERS#
        #========#
        # Grabs first ten non-Featured rentals from the SoHo search results
        @rentals = scraper.run("rent")
        # Grabs first ten non-Featured sales from the SoHo search results 
        @sales = scraper.run("sale")
        # I'd like to explain why I chose this: the challenge asked for the "top 20"
        # But did not specify whether it was twenty of each or twenty in total
        # I used my best judgement, and assumed that it meant 20 in total
        # As I'd expect twenty each would be phrased closer to "top 20 rentals and top 20 sales"
        @result= []

        #==============================#
        #WRAPS XML INTO LISTING OBJECTS#
        #==============================#

        #Maps the arrays of XML elements into a new array of combined Listing Objects
        @result.concat(wrapper.run(@rentals))
        @result.concat(wrapper.run(@sales))

        #The results array, at this point, is listed with prices in Ascending order
        #So the array gets reversed here.
        @result.sort_by {|listing| listing.price}.reverse!
      end

end
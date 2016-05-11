
class ListingScraper
  require 'open-uri'
  attr_accessor :xml


  def run(listing_class)
    @xml = Nokogiri::HTML(open("http://streeteasy.com/for-"+listing_class+"/soho?sort_by=price_desc")).css('div.item')[2...12]
  end

end
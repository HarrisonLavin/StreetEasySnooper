class ListingParser
  require 'Nokogiri'
  require 'open-uri'

  def self.parse_listings

    @rentals = Nokogiri::HTML(open("http://streeteasy.com/for-rent/soho?sort_by=price_desc")).css('div.item')[2...12]
    @sales = Nokogiri::HTML(open("http://streeteasy.com/for-sale/soho?sort_by=price_desc")).css('div.item')[2...12]
    @result= []

    @rentals.each_with_index do |listing, index|
      @result[index]= Listing.new({
        listing_class: get_class_of(@rentals, index),
        address: get_address_of(@rentals,index),
        unit: get_unit_of(@rentals,index),
        url: get_url_of(@rentals,index),
        price: get_price_of(@rentals,index)
      })
    end

    @sales.each_with_index do |listing, index|
      @result[@rentals.size + index]= Listing.new({
        listing_class: get_class_of(@sales,index),
        address: get_address_of(@sales,index),
        unit: get_unit_of(@sales,index),
        url: get_url_of(@sales,index),
        price: get_price_of(@sales,index)
      })
    end
    
    @result.sort_by {|listing| listing.price}.reverse!
  end

  def self.get_class_of(array, listing)
    array[listing].children[3].children.children[1].attributes["data-gtm-listing-type"].value
  end

  def self.get_address_of(array,listing)
    address= array[listing].children[3].children.children.children[0].text
    address= address.gsub(/\s[#].*/, "")
  end

  def self.get_unit_of(array,listing)
    unit = array[listing].children[3].children.children.children[0].text
    unit = /#.*/.match(unit).to_s[1..-1]
  end

  def self.get_price_of(array,listing)
    price = /[$].*[\n]/.match(array[listing].text).to_s[1...-1]
    price.gsub(/[,]/,"").to_i
  end

  def self.get_url_of(array,listing)
    url_end = array[listing].children[3].children.children[1].attributes["href"].value
    "http://streeteasy.com"+ url_end 
  end

end
class Listing

attr_accessor :listing_class, :price, :address, :url, :unit
  def initialize(input)
    @listing_class = input[:listing_class]
    @price= input[:price]
    @address= input[:address]
    @url= input[:url]
    @unit= input[:unit]
  end

end


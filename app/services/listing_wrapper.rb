 class ListingWrapper

  attr :result

  def initialize(array)
    @result = []
    array.each_with_index do |listing, index|
      @result[index]= Listing.new({
        listing_class: ListingSanitizer.get_class_of(array,index),
        address:       ListingSanitizer.get_address_of(array,index),
        unit:          ListingSanitizer.get_unit_of(array,index),
        url:           ListingSanitizer.get_url_of(array,index),
        price:         ListingSanitizer.get_price_of(array,index)
      })
    end
  end

end
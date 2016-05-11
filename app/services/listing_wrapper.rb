class ListingWrapper

  attr :listings

  def run(array)
    @listings = []
    cleaner = ListingSanitizer.new()
    array.each_with_index do |listing, index|
      @listings[index]= Listing.new({
        listing_class: cleaner.get_class_of(array,index),
        address:       cleaner.get_address_of(array,index),
        unit:          cleaner.get_unit_of(array,index),
        url:           cleaner.get_url_of(array,index),
        price:         cleaner.get_price_of(array,index)
      })
    end
    @listings
  end

end
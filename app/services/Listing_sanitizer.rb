class ListingSanitizer

    #====================#
    #ATTRIBUTE SANITIZERS#
    #====================#
    #After playing with the XML results of the scrape extensively
    #I found a way to reliably extract the data that I wanted from the listings
    #Ergo, the horrifying hard-coded locators.

    #Additionally, all of these methods are abstract, taking in an array
    #So as to be re-used by both Sales and Rentals
    
  def get_class_of(array, listing)
    array[listing].children[3].children.children[1].attributes["data-gtm-listing-type"].value
  end

  def get_address_of(array,listing)
    address= array[listing].children[3].children.children.children[0].text
    address= address.gsub(/\s[#].*/, "")
  end

  def get_unit_of(array,listing)
    unit = array[listing].children[3].children.children.children[0].text
    unit = /#.*/.match(unit).to_s[1..-1]
  end

  def get_price_of(array,listing)
    price = /[$].*[\n]/.match(array[listing].text).to_s[1...-1]
    price.gsub(/[,]/,"").to_i
  end

  def get_url_of(array,listing)
    url_end = array[listing].children[3].children.children[1].attributes["href"].value
    "http://streeteasy.com"+ url_end 
  end

end
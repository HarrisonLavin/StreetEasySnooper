class ListingsController < ApplicationController

  def index
    parser = ListingParser.new()
    @listings = parser.parse_listings
  end

  def show

  end

  def json
    parser = ListingParser.new()
    @listings = parser.parse_listings
    render json: @listings
  end

end

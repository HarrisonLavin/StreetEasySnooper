class ListingsController < ApplicationController

  def index
    @listings = ListingParser::parse_listings
  end

  def outbound
    @listings = ListingParser::parse_listings
    render json: @listings
  end

end

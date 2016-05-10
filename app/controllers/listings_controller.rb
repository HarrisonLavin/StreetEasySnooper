class ListingsController < ApplicationController

  def index
    @listings = ListingParser::parse_listings
  end

  def show
  end

  def outbound
    @listings = ListingParser::parse_listings
    render json: @listings
  end

end

class ListingsController < ApplicationController

  before_filter :authenticate_user!, except: [:show]

  def index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      current_user.listings << @listing
      flash[:notice] = "New listing created"
      redirect_to listings_path
    else
      render 'new'
    end
  end

  def show
    @listing = Listing.find params[:id]
  end

  private

  def listing_params
    params.require(:listing).permit( :address, :city, :state,
                                     :zipcode, :number_of_people,
                                     :price_per_night, :property_type)
  end

end

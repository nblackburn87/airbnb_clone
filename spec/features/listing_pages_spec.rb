require 'spec_helper'

describe Listing do

  context 'creating' do

    it 'allows a signed in user to add a new listing' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      click_link "Manage your Listings"
      click_link "Add Listing"
      listing = FactoryGirl.build(:entire_place)
      fill_in :listing_address, with: listing.address
      fill_in :listing_city, with: listing.city
      fill_in :listing_state, with: listing.state
      fill_in :listing_zipcode, with: listing.zipcode
      fill_in :listing_number_of_people, with: listing.number_of_people
      fill_in :listing_price_per_night, with: listing.price_per_night
      select(listing.property_type, from: :listing_property_type )
      click_button "Create Listing"
      page.should have_content "New listing created"
    end
  end


end

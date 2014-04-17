require 'spec_helper'

describe Listing do
  context 'creating' do
    it 'allows a signed in user to add a new listing' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_listing_path
      listing = FactoryGirl.build(:entire_place)
      create_listing(listing)
      page.should have_content "New listing created"
    end
  end
  context 'editing' do
    it 'allows anyone to view the details of a listing' do
      listing = FactoryGirl.create(:shared_room)
      visit listing_path(listing)
      page.should have_content listing.address
      page.should_not have_content "Edit listing"
    end
    it 'allows user who is signed in to edit their own listing' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      listing = FactoryGirl.create(:entire_place)
      create_listing(listing)
      visit edit_listing_path(listing)
      fill_in :listing_address, with: Faker::Address.street_address
      click_button "Update"
      page.should have_content "Your listing has been updated."
    end
    it 'allows a user who is signed in to delete their own listing' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      listing = FactoryGirl.create(:entire_place)
      create_listing(listing)
      visit listing_path(listing)
      click_link "Delete listing"
      page.should have_content "Your listing has been deleted."
    end
  end
end

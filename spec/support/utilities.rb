def sign_in(user)
  visit root_url
  click_link "Login"
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  click_button "Sign in"
end

def create_listing(listing)
  visit new_listing_path
  fill_in :listing_address, with: listing.address
  fill_in :listing_city, with: listing.city
  fill_in :listing_state, with: listing.state
  fill_in :listing_zipcode, with: listing.zipcode
  fill_in :listing_number_of_people, with: listing.number_of_people
  fill_in :listing_price_per_night, with: listing.price_per_night
  select(listing.property_type, from: :listing_property_type )
  click_button "Create Listing"
end


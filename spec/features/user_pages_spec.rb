require 'spec_helper'

describe User do
  it 'allows a new user to create an account' do
    visit new_user_registration_path
    user = FactoryGirl.build(:user)
    fill_in :user_name, with: user.name
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    fill_in :user_email, with: user.email
    click_button "Sign up"
    page.should have_content "Logged in"
  end
   it 'displays errors if a user enters the wrong information' do
    visit new_user_registration_path
    user = FactoryGirl.build(:user)
    fill_in :user_name, with: user.name
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: "password"
    fill_in :user_email, with: user.email
    click_button "Sign up"
    page.should_not have_content "Logged in"
  end
end

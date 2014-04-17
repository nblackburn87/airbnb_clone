require 'spec_helper'

describe User do
  context "creating" do
    it 'allows a new user to create an account' do
      visit new_user_registration_path
      user = FactoryGirl.build(:user)
      fill_in :user_name, with: user.name
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      fill_in :user_password_confirmation, with: user.password_confirmation
      click_button "Sign up"
      page.should have_content "Welcome! You have signed up successfully."
    end
     it 'displays errors if a user enters the wrong information' do
      visit new_user_registration_path
      user = FactoryGirl.build(:user)
      sign_in(user)
      page.should_not have_content "Logged in"
    end
  end

  context "editing" do
    it 'displays the edit page when navigated to' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit edit_user_registration_path
      page.should have_content "New Password (leave"
    end

    it 'lets a signed in user edit their password' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit edit_user_registration_path
      new_password = Faker::Internet.password
      fill_in :user_password, with: new_password
      fill_in :user_password_confirmation, with: new_password
      fill_in :user_current_password, with: user.password
      click_button "Update"
      page.should have_content "You updated your account successfully."
    end
  end
end

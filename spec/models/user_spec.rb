require 'spec_helper'

describe User do
  it { should have_many :listings }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it "sends an email when the user is created" do
    user = FactoryGirl.create(:user)
    ActionMailer::Base.deliveries.last.to.should eq [user.email]
  end

end

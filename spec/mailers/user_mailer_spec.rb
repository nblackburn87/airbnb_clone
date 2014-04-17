require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    user = FactoryGirl.build(:user)

    let(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
      user.save
      mail.subject.should eq("Signup Confirmation")
      mail.to.should eq(["#{user.email}"])
      mail.from.should eq(["admin@openhome.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("#{user.name},")
    end
  end

end

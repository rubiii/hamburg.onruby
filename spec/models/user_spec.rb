require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe User do
  before { @user = User.new }

  describe "validates" do
    it "that the username contains at least 3 characters" do
      @user.username = "ab"

      @user.should have(1).errors_on(:username)
      @user.should_not be_valid
    end

    it "that the username does not contain invalid characters" do
      @user.username = "dude?"

      @user.should have(1).errors_on(:username)
      @user.should_not be_valid
    end

    it "that the username is unique" do
      User.create! :username => "dude", :email => "dude@example.com", :password => "secret"
      @user = User.new :username => "dude", :email => "dude@ruby.com", :password => "topsecret"

      @user.should have(1).errors_on(:username)
      @user.should_not be_valid
    end
  end

end

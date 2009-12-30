require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe ApplicationHelper do
  include ApplicationHelper
  fixtures :users, :projects

  # Stub the current_user method from ApplicationController.
  attr_accessor :current_user

  describe "account_links" do
    it "should return the edit profile and logout links for a logged in user" do
      @current_user = users :dette
      account_links[0][:link].should eql edit_user_path(:current)
      account_links[1][:link].should eql logout_path
    end
    
    it "should return the edit register and login links for an unauthenticated user" do
      @current_user = false
      account_links[0][:link].should eql register_path
      account_links[1][:link].should eql login_path
    end
  end

  describe "setup_user" do
    it "should set up an initial empty project for a user" do
      lesch = setup_user users(:lesch)
      lesch.projects.should_not be_empty
    end
    
    it "should not add an empty project to users with existing projects" do
      dette = users(:dette)
      dette.projects << projects(:iphone) << projects(:android)
      dette = setup_user dette
      dette.projects.size.should eql 2
    end
  end

end

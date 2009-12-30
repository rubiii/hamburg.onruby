require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe User do
  fixtures :users, :projects

  before do 
    @user = User.new 
    @project = projects(:iphone)
  end

  it "validates that the username contains at least 3 characters" do
    @user.username = "ab"
    @user.should have(1).error_on(:username)
  end

  it "validates that the username does not contain invalid characters" do
    @user.username = "dude?"
    @user.should have(1).error_on(:username)
  end

  it "validates that the username is unique" do
    @user = User.new :username => users(:dette).username, :email => "wtf@example.com", :password => "wtfwtfwtf"
    @user.should have(1).error_on(:username)
  end

  it "finds a user by username as the id" do
    @user = User.find "dette"
    @user.username.should eql "dette"
  end

  it "has a gravatar url" do
    @user.gravatar_url.should_not be_nil
  end

  it "returns the username as the param" do
    @user.username = "dude"
    @user.to_param.should eql "dude"
  end

  it "should have many projects" do
    User.reflect_on_association(:projects).should_not be_nil
  end

  it "should cascade projects" do
    @user = users(:dette)
    @user.projects << @project
    @user.save
    User.find("dette").projects.first.id.should eql @project.id
  end

  it "should allow projects to be destroyed" do
    @user = users(:dette)
    @user.projects = []
    @user.save
    Project.exists?(1).should be_false
  end

  it "should allow blank passwords on update" do
    @user = users(:dette)
    @user.password = ""
    @user.should be_valid
  end

  it "should validate the email has at least 3 chars" do
    @user = users(:dette)
    @user.email = "ab3"
    @user.should have(2).errors_on(:email)
  end
  
  it "should validate the email has a valid format" do
    @user = users(:dette)
    @user.email = "ab3sdlajfkldskjflks"
    @user.should have(1).errors_on(:email)
  end
  
  it "should have a company" do
    @user = users(:dette)
    @user.company.should_not be_nil
  end
  
end
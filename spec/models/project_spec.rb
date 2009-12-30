require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Project do
  fixtures :projects

  it "should belong to a user" do
    Project.reflect_on_association(:user).should_not be_nil
  end

  it "should validate presence of name" do
    iphone = projects(:iphone)
    iphone.name = ""
    iphone.should have(1).error_on(:name)
  end

  it "should validate the format of link" do
    android = projects(:iphone)
    ["", "bla", "http://"].each do |invalid|
      android.link = invalid
      android.should have(1).error_on(:link)
    end
  end

  it "should accept valid data" do
    iphone = Project.new :name => "htc", :link => "http://bla.com"
    iphone.should be_valid
  end

end
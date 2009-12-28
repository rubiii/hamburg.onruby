require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe UsersController do

  describe "GET :index" do
    before { get :index }

    it "successfully renders the :index template" do
      response.should be_success
      response.should render_template :index
    end

    it "assigns :users" do
      assigns[:users].should be_an Array
    end
  end

end

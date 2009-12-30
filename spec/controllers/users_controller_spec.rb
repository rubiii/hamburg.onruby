require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe UsersController do
  include Authlogic::TestCase
  setup :activate_authlogic
  fixtures :users

  describe "GET :index" do
    before { get :index }

    it "should render :index" do
      response.should be_success
      response.should render_template :index
    end

    it "should assign :users" do
      assigns[:users].should be_an Array
    end
  end

  describe "GET :new" do
    before { get :new }

    it "should render :new" do
      response.should be_success
      response.should render_template :new
    end

    it "should assign :user" do
      assigns[:user].should be_an_instance_of User
    end
  end

  describe "POST :create" do
    it "should render :new on error" do
      post :create, :user => {:username => 'uschi', :password => '', :email => 'uschi@muschi.de'}
      response.should be_success
      response.should render_template :new
    end

    describe "on success" do
      before { post :create, :user => {:username => 'uschi', :password => 'muschi', :email => 'uschi@muschi.de'} }

      it "should redirect to root" do
        response.should redirect_to root_url
      end

      it "should have flash" do
        flash[:notice].should_not be_nil
      end
    end
  end

  describe "GET :show" do
    describe "on success" do
      before { get :show, :id => users(:dette).username }

      it "should render :show" do
        response.should render_template :show
      end

      it "should assign :user" do
        assigns[:user].should be_a User
      end
    end

    describe "on error" do
      before { get :show, :id => 'unknown' }

      it "should render :not_found" do
        response.should render_template :not_found
      end

      it "should assign :username" do
        assigns[:username].should be_a String
      end
    end
  end
  
  describe "GET :edit" do
    it "should redirect unauthenticated users to root" do
      get :edit, :id => "unknown"
      response.should redirect_to root_url
    end
    
    describe "for a logged in user" do
      before do
        UserSession.create users(:dette)
        get :edit, :id => users(:dette).username
      end
      
      it "should render :edit" do
        response.should render_template :edit
      end
      
      it "should assign the logged in :user" do
        assigns(:user).should be_a User
        assigns(:user).username.should eql users(:dette).username
      end
    end
  end
  
  describe "POST :update" do
    before { UserSession.create users(:dette) }
    describe "on success" do
      before { post :update, {:id=>'dette', :user => {:username => 'dette', :email => 'uschi@muschi.de'}} }
      
      it "should update :user" do
        assigns(:user).should be_a User
        assigns(:user).email.should eql 'uschi@muschi.de'
      end

      it "should render :root" do
        response.should redirect_to root_url
      end
      
      it "should flash :notice" do
        flash[:notice].should_not be_nil
      end
    end
    
    describe "on error" do
      before { post :update, {:id=>'dette', :user => {:username => 'dette', :email => '@muschi.de'}} }
      
      it "should render :edit" do
        response.should render_template :edit
      end
    end
  end

end

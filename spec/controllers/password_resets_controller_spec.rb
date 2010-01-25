require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe PasswordResetsController do
  include Authlogic::TestCase
  setup :activate_authlogic
  fixtures :users

  describe "POST :create" do
    before { UserSession.create users(:dette) }
    
    describe "on success" do
      before { post :create, :user => { :email => users(:dette).email } }

      it "should redirect to :root" do
        response.should redirect_to(root_url)
      end

      it "should have flash :notice" do
        flash[:notice].should_not be_nil
      end
    end

    describe "on error" do
      before { post :create, :user => { :email => 'unknown@e.mail' } }

      it "should render :new" do
        response.should render_template(:new)
      end

      it "should have flash :notice" do
        flash[:notice].should_not be_nil
      end
    end
  end

  describe "POST :update" do
    describe "on success" do
      before { post :update, :id => 'perish_secret', :user => { :password => 'good_password' } }

      it "should assign user" do
        assigns(:user).should be_a(User)
      end

      it "should redirect to :login" do
        response.should redirect_to(login_url)
      end
    end

    describe "on error" do
      it "should redirect :root for unknown token" do
        post :update, :id => 'unknown_perish_secret'
        response.should redirect_to(root_url)
      end

      it "should flash :notice for unknown token" do
        post :update, :id => 'unknown_perish_secret'
        flash[:notice].should_not be_nil
      end

      it "should render :edit for illegal password" do
        post :update, :id => 'perish_secret', :user => { :password => 'ts' }
        response.should render_template(:edit)
      end
    end
  end

  describe "GET :edit" do
    it "should render :edit for known :id" do
      get :edit, :id => 'perish_secret'
      response.should render_template(:edit)
    end

    it "should redirect :edit for known :id" do
      get :edit, :id => 'unknown_perish_secret'
      response.should redirect_to(root_url)
    end
  end

end
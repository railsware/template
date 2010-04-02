require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do
  #Testing authentication form
  describe 'get new' do
    # The form should work only for users that are not authenticated
    describe 'being anonymous' do
      before(:each) do
        logout
        get :new
      end
      
      should_render_template :new 
      should_respond_with :success
      
      # rspec has no shoulda controller matchers yet :(. So should test it another way
      # should_have_form :user_session
    end
    
    # Authenticated users should not be able to re-register
    describe 'being logged in' do
      before(:each) do
        login
        get :new
      end
      
      should_redirect_to { account_path }
    end
  end
  
  #Logged in users should not re-login
  describe 'logging in' do
    describe 'being logged in' do
      before(:each) do
        login
        post :create
      end
      
      should_redirect_to { account_path }
    end
  end
  
  describe 'being anonymous' do
    describe 'with valid credentials' do
      before(:each) do
        logout
        # Session should be saved before proceeding
        UserSession.any_instance.expects(:save).returns(true)
        post :create
      end
      
      should_redirect_to { root_path }
    end
    
    describe 'supplying invalid credentials' do
      before(:each) do
        logout
        UserSession.any_instance.expects(:save).returns(false)
        post :create
      end
      
      should_respond_with :redirect
      should_redirect_to { login_path }
    end
  end
  
  describe "logging out" do
    before(:each) do
      login
      post :destroy
    end
    
    it "should redirect user to the homepage" do
      response.should redirect_to root_path
    end
    
    it "should notice user that he/she is logged out" do
      flash[:notice].should_not be_nil
    end
  end
end
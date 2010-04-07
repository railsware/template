require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::UserSessionsController do
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
      end
      
      it "should redirect to login path if user is not admin" do
        post :create, :user_session => { :login => current_user.login }
        response.should redirect_to new_admin_user_session_path
      end
      
      it "should redirect to users path if user is admin and session data is right" do
        current_user.has_role! :admin
        # Session should be saved before proceeding
        UserSession.any_instance.expects(:save).returns(true)
        post :create, :user_session => { :login => current_user.login }
        response.should redirect_to admin_users_path
      end

      it "should redirect to login path if user is admin but the session data is wrong" do
        current_user.has_role! :admin
        # Session should be saved before proceeding
        UserSession.any_instance.expects(:save).returns(false)
        post :create, :user_session => { :login => current_user.login }
        response.should redirect_to new_admin_user_session_path
      end
    end
    
    describe 'supplying invalid credentials' do
      before(:each) do
        logout

      end
      
      it "should redirect to login page if credentials are not valid" do
        UserSession.any_instance.expects(:save).returns(false)
        post :create, :user_session => { :login => current_user.login }
        response.should redirect_to new_admin_user_session_path
      end
    end
  end
end
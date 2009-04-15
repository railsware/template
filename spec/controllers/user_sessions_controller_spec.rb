require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do
  describe 'get new' do
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
    
    describe 'being logged in' do
      before(:each) do
        login
        get :new
      end
      
      should_redirect_to { account_path }
    end
  end
  
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
        UserSession.any_instance.expects(:save).returns(true)
        post :create
      end
      
      should_redirect_to { account_url }
    end
    
    describe 'supplying invalid credentials' do
      before(:each) do
        logout
        UserSession.any_instance.expects(:save).returns(false)
        post :create
      end
      
      should_respond_with :success
      should_render_template :new
    end
  end
end
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::UsersController do

  describe "Users with appropriate access rights" do
    before(:each) do
      logout
      login
      current_user.has_role! :admin
    end

    it "should get list of users" do
      get :index
      response.should respond_with :success
      assigns(:users).include?(current_user).should == true
    end

  end
  
  describe "Users without appropriate access rights" do
    before(:each) do
      logout
      #current_user.has_role! :admin
    end
    
    it "should deny access for anonymou users" do
      get :index
      response.should redirect_to new_admin_user_session_path
    end
    
    it "should deny access for logged in users without admin rights" do
      login
      get :index
      response.should redirect_to new_admin_user_session_path
    end
  end
  
end
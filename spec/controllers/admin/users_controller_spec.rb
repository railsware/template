require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::UsersController do

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
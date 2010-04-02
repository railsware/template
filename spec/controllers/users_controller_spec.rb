require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do

  before(:each) do
    logout
  end
  
  it "should successfully show user registration page" do
    get :new
    response.should respond_with :success
    assigns(:user).should be_an_instance_of(User)
  end
  
  describe "creation of new user" do
    
    it "should normally create user, notice us and redirect to the homepage" do
      sample_login = "thisistestinglogin"
      post :create, :user => {
          :login => sample_login,
          :email => "thisistesting@example.com",
          :password => "foobar0123",
          :password_confirmation => "foobar0123"
      }
      assigns(:user).login.should == sample_login
      response.should redirect_to root_path
      flash[:notice].should_not be_nil
    end
    
    it "should not create users with incorrect credentials" do
      post :create, :user => {
          :login => "thisistestinglogin",
          :email => "thisistesting@example.com",
          :password => "foobar0123",
          :password_confirmation => ""
      }
      response.should redirect_to new_user_path
      flash[:error].should_not be_nil
    end
  end
  
  describe "Manipulations with loaded user" do
    before(:each) do
      login
    end
    
    it "it should show currently logged user on profile view" do
      get :show
      assigns(:user).should == current_user
    end
    
    it "it should show currently logged user on profile editing" do
      get :edit
      assigns(:user).should == current_user
    end
    
    describe "Updating user data" do
      it "should update user details if the data is correct" do
        post :update, :user => { :id => current_user.id, :email => "foofoo@bar.com" }
        assigns(:user).should == current_user
        flash[:notice].should_not be_nil
        response.should redirect_to user_path(current_user)
      end
      
      it "should not update user if details is incorrect, should notify user on it" do
        post :update, :user => { :id => current_user.id, :login => "" }
        flash[:error].should_not be_nil
        response.should redirect_to edit_user_path(current_user)
      end
    end
  
  end
end
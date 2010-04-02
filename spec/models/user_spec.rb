require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @user = Factory(:user)
  end
  
  should_validate_presence_of :email
  should_validate_presence_of :login
  should_validate_presence_of :password, :on => :create
  should_validate_presence_of :password_confirmation, :on => :create
  should_validate_length_of :password, :within => 4..30, :on => :create
  should_validate_length_of :login, :within => 4..30

end

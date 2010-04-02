def current_user  
  # Create new test user
  @current_user ||= Factory(:user)  
end  

def user_session  
  @user_session = mock('user')
  # session returns current user
  @user_session.stubs(:user).returns(current_user)  
  @user_session.stubs(:record)
  @user_session.stubs(:destroy) 
  @user_session  
end  

def login  
  UserSession.stubs(:find).returns(user_session)  
end  

def logout  
  @user_session = nil  
end
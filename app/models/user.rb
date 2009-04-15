class User < ActiveRecord::Base
  # Authlogic-driven
  acts_as_authentic
  
  #acl9 stuff
  acts_as_authorization_subject
end

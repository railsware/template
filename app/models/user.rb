class User < ActiveRecord::Base
  # Authlogic-driven
  acts_as_authentic
  
  #acl9 stuff
  acts_as_authorization_subject
  
  #will_paginate defaults
  cattr_reader :per_page
  @@per_page = 10
end

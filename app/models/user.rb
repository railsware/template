class User < ActiveRecord::Base

  # === List of columns ===
  #   id                : integer 
  #   login             : string 
  #   email             : string 
  #   crypted_password  : string 
  #   password_salt     : string 
  #   persistence_token : string 
  #   created_at        : datetime 
  #   updated_at        : datetime 
  # =======================

  # Authlogic-driven
  acts_as_authentic
  
  #acl9 stuff
  acts_as_authorization_subject
  
  #will_paginate defaults
  cattr_reader :per_page
  @@per_page = 10
end

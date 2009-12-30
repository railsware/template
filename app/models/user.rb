class User < ActiveRecord::Base

  # Authlogic-driven
  acts_as_authentic
  
  #acl9 stuff
  acts_as_authorization_subject
  
  #will_paginate defaults
  cattr_reader :per_page
  @@per_page = 10
end
# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  login             :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#


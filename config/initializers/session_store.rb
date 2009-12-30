# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ptemplate_session',
  :secret      => '0b54e6db60ee873b64b69d72befb2cde2c50c50acaafd94b7ca05a9f2108e0a5a85ecde0f4fcd2e71030f63fe4b8286ebd9909b3b8c53452b4c52bef44e62012'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store

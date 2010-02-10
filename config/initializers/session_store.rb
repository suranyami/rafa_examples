# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rafa_examples_session',
  :secret      => 'c23040a2a820eaac1a1595a5f359d61ea5815f5327050e092b878328a0b75f4a000e8dcb572da2009e2a8d546637e31c606e1c5f65d0170c0bb0412430caa665'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

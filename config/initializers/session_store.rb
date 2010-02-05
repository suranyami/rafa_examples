# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rafa_examples_session',
  :secret      => 'b217a0591afb80c9d9143b03e899dd95abf58a5e9e24a63afde23bc9423e6967eba853a2a8359be4760bdb1b22391f4a3831c5aba7c1d2b3cb358012a76c4b5e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

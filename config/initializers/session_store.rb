# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rafa_examples_session',
  :secret      => '9d365627032546726ea4764152855bd4872c5c9d7731d60740dba5ce95763c376d043c2c415962e4874d3b6a23d0ebe7cf5d35613833f270f68017774b9b75b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

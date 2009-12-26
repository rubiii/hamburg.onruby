# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hamburgonruby_session',
  :secret      => '81b7ad7934fe656c261716f5832b1b6b85638e32317ecbeb3b451ed9dbc41e63df20fd5e7036576f868263116dd5a8811bd12b415cd91a7cc6395cf0e93f0213'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eventer_session',
  :secret      => '453b0e4b88f7c81cbcd0d40bb6336e42817d791f60211c71fe3cf4c92a3a6baadb5958a12690f2d86ada19754ab27eb7f8247367bd526b62cef48bdb4d4324d6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sevdev_session',
  :secret      => 'c1cae7ebf3c0cae3cb28a50dec6d798cac1bb24ef91e31b4ecee5147d430649a8cc4dff8a56cfe3008c5d6109259e3248748fc7aaff010150f06d368cf0f7a01'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

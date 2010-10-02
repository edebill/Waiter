# Be sure to restart your server when you modify this file.
CACHE = MemCache.new(:namespace => 'waiter')
CACHE.servers = 'localhost:11211'

#Rails.application.config.session_store :mem_cache_store

Rails.application.config.session_store :mem_cache_store, {
  :cache => CACHE,
  :session_key => '_waiter_session',
  :secret => 'kWleS2hzWDvvEHYj1bK5ZYo8as098asdf3098sfkhjzv7KSHVB',
  :expire_after => 60
}


# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# Rails.application.config.session_store :active_record_store

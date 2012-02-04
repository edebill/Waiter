# Be sure to restart your server when you modify this file.
#CACHE = Dalli::Client.new('localhost:11211')

#Rails.application.config.session_store :mem_cache_store
#require 'action_dispatch/middleware/session/dalli_store'
#Rails.application.config.session_store :dalli_store, {
#  :memcache_server => ['127.0.0.1:11211'],
#  :namespace => 'waiter',
#  :session_key => '_waiter_session',
#  :secret => 'kWleS2hzWDvvEHYj1bK5ZYo8as098asdf3098sfkhjzv7KSHVB',
#  :expire_after => 172800
#}


# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
Waiter::Application.config.session_store :active_record_store

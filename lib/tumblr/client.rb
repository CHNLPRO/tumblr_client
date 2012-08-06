require 'tumblr/blog'
require 'tumblr/user'
require 'tumblr/request'
require 'tumblr/connection'
require 'tumblr/post'
require 'tumblr/helpers'
require 'tumblr/config'

module Tumblr
  class Client
    include Tumblr::Request
    include Tumblr::Client::Blog
    include Tumblr::Client::User
    include Tumblr::Client::Post
    include Tumblr::Client::Helper
    include Tumblr::Connection

    attr_accessor *Config::VALID_OPTIONS_KEYS
    
    def initialize(attrs= {})
      attrs = Tumblr.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", attrs[key])
      end
    end

    def credentials
      {
          :consumer_key => consumer_key,
          :consumer_secret => consumer_secret,
          :token => oauth_token,
          :token_secret => oauth_token_secret
      }
    end
  end
end

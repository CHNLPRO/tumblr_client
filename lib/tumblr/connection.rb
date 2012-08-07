require 'faraday_middleware'

module Tumblr
  module Connection
    def connection(options={})
      default_options = {
        :headers => {
          :accept => "application/json",
          :user_agent => "Tumblr v1.0"
        },
        :url => "http://api.tumblr.com/"
      }
      Faraday.new("http://api.tumblr.com/", default_options.merge(options)) do |conn|
        conn.use(FaradayMiddleware::OAuth, credentials) if credentials[:token]
        conn.use(Faraday::Request::UrlEncoded)
        conn.use(FaradayMiddleware::ParseJson, :content_type => "application/json")
        conn.adapter(:net_http)
      end
    end
  end
end

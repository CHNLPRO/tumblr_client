require 'json'

module Tumblr
  module Request

    #
    # All Tumblr::Request methods have the same return signature (below)
    # @returns Hash: {"response" => repsonse, "meta" => {"status" => xxx, "msg" => msg}}
    #

    def get(path, params={})
      response = connection.get do |req|
        req.url path
        req.params = params
      end
      response.body
    end
    
    def post(path, params={})
      response = connection.post do |req|
        req.url path
        req.body = params unless params.empty?
      end
      response.body
    end
  end
end

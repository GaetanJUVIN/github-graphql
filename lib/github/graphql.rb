# Github Utilities Module
module Github
  require 'net/http'
  require 'uri'
  require 'json'

  # Used to Query the Github GraphQL API
  class GraphQL
    def initialize(token, query, vars)
      @payload = {}

      uri = URI.parse('https://api.github.com/graphql')
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true

      @request = Net::HTTP::Post.new(uri)
      @request['Content-type'] = 'application/json'

      token(token)
      payload(query, vars)
    end

    def token(token)
      @request['Authorization'] = "bearer #{token}"
    end

    def payload(query, vars)
      @payload['query'] = query
      @payload['variables'] = vars
      @request.body = @payload.to_json
    end

    def query
      response = @http.request(@request)
      JSON.parse(response.body)
    end
  end
end

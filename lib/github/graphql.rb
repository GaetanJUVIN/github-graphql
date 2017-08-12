##
# This module contains tools for interacting with the Github API
#
module Github
  require 'net/http'
  require 'uri'
  require 'json'

  ##
  # This class is used to make queries to the Github GraphQL API
  #
  class GraphQL
    ##
    # Expects a valid Github OAuth token & the GraphQL query string,
    # and optionally a hash array of any variables to be passed with
    # the query.
    #
    # With raise an ArgumentError if either token or query are nil.
    #
    def initialize(token, query, vars = nil)
      @payload = {}

      uri = URI.parse('https://api.github.com/graphql')
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true

      @request = Net::HTTP::Post.new(uri)
      @request['Content-type'] = 'application/json'

      token(token)
      payload(query, vars)
    end

    ##
    # Set the OAuth token.
    #
    # Will raise an ArgumentError if token is nil
    #
    def token(token)
      raise ArgumentError, 'Invalid Token', caller unless
        token =~ /\A[A-Za-z0-9]{40,40}\z/
      @request['Authorization'] = "bearer #{token}"
    end

    ##
    # Set the query string and optionally the variables to be passed
    # with the query.
    #
    # Will raise an ArgumentError if query is nil
    #
    def payload(query, vars = nil)
      raise ArgumentError, 'Cannot have nil query!', caller if query.nil?
      @payload['query'] = query
      @payload['variables'] = vars
      @request.body = @payload.to_json
    end

    ##
    # Execute the query.
    #
    # Returns a ruby hash array of the response from Github.
    #
    def query
      response = @http.request(@request)
      JSON.parse(response.body)
    end
  end

  ##
  # Execute a query to the GraphQL API. Expects a valid Github OAuth
  # token and the query string, and optionally a hash array of the
  # variables to be passed with the query.
  #
  # Will raise an ArgumentException if either token or query are nil.
  #
  def self.query(token, query, vars = nil)
    GraphQL.new(token, query, vars).query
  end
end

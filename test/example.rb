#!/usr/bin/env ruby

require 'github/graphql'

nilhash = {}

api = Github::GraphQL.new('test', nilhash, nilhash)

puts api.query.inspect

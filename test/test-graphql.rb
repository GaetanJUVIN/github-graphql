#!/usr/bin/env ruby

require_relative '../lib/github/graphql.rb'
require 'test/unit'

class TestQuery < Test::Unit::TestCase

  def test_blank
    assert_equal(Github::GraphQL.new('', '').query['message'], 'Bad credentials')
  end

  def test_nil_auth
    assert_raise(ArgumentError) { Github::GraphQL.new(nil, '') }
  end

  def test_nil_query
    assert_raise(ArgumentError) { Github::GraphQL.new('', nil) }
  end

  def test_blank_static
    assert_equal(Github.query('', '')['message'], 'Bad credentials')
  end

end

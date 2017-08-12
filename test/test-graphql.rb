#!/usr/bin/env ruby

require_relative '../lib/github/graphql.rb'
require 'test/unit'

class TestQuery < Test::Unit::TestCase

  TEST_TOKEN = '0000000000000000000000000000000000000000'

  def test_blank
    assert_equal(Github::GraphQL.new(TEST_TOKEN, '').query['message'], 'Bad credentials')
  end

  def test_nil_auth
    assert_raise(ArgumentError) { Github::GraphQL.new(nil, '') }
  end

  def test_short_auth
    assert_raise(ArgumentError) { Github::GraphQL.new('tooshort', '') }
  end

  def test_long_auth
    assert_raise(ArgumentError) { Github::GraphQL.new(TEST_TOKEN + 'toolong', '') }
  end

  def test_bad_auth
    assert_raise(ArgumentError) { Github::GraphQL.new(TEST_TOKEN[0..38] + '!', '') }
  end

  def test_nil_query
    assert_raise(ArgumentError) { Github::GraphQL.new('', nil) }
  end

  def test_blank_static
    assert_equal(Github.query(TEST_TOKEN, '')['message'], 'Bad credentials')
  end

end

#!/usr/bin/env ruby

require 'github/graphql'
require 'test/unit'

class TestQuery < Test::Unit::TestCase
  
  def test_no_auth
    assert_equal(Github::GraphQL.new('', '', nil).query['message'], 'Bad credentials')
  end

  def test_no_auth_short
    assert_equal(Github::GraphQL.new('', '').query['message'], 'Bad credentials')
  end

end

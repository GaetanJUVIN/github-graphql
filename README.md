# Github GraphQL API Library

Ruby Library for Making Queries to the Github GraphQL API

[![Travis CI](https://img.shields.io/travis/karagenit/github-graphql.svg?style=flat-square)](https://travis-ci.org/karagenit/github-graphql)
[![Gem Version](https://img.shields.io/gem/v/github-graphql.svg?style=flat-square)](https://rubygems.org/gems/github-graphql)
[![Gem](https://img.shields.io/gem/dt/github-graphql.svg?style=flat-square)](https://rubygems.org/gems/github-graphql)

## Installation

```
$ gem install github-graphql
```

Will fetch the `json` gem as a runtime dependency.

## Usage

```
# Your script
require "github/graphql"

api = Github::GraphQL.new(oauth_token, query_string, variables_hash)
data = api.query
```

Where `oauth_token` is your Github API Key, `query_string` is your GraphQL query as a string *(including newlines)*, and `variables_hash` is a hash array of all of the required variables (can be nil). Returns a hash array of the response data. 

Optionally, you can re-set either the key or the query/variables later on:

```
api.token(token)
api.payload(query_string, variables_hash)
```

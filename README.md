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

### Developers

First, fork this repo on github, then:

```
$ git clone https://github.com/#{user}/github-graphql
```

To fetch development dependencies:

```
$ bundle install
```

This will download `rake`, `bundler`, `rubocop`, `test-unit`, and `github_changelog_generator`.

## Usage

```
#!/usr/bin/env ruby

require "github/graphql"

data = Github.query(oauth_token, query_string, variables_hash)
```

Where `oauth_token` is your Github API Key, `query_string` is your GraphQL query as a string *(including newlines)*, and `variables_hash` is a hash array of all of the required variables (optional argument). Returns a hash array of the response data. 

Alternatively, you can construct a `GraphQL` object to make repeated queries:

```
#!/usr/bin/env ruby

require "github/graphql"

api = Github::GraphQL.new(oauth_token, query_string, variables_hash)
data = api.query
```

Optionally, you can re-set either the key or the query/variables later on:

```
api.token(token)
api.payload(query_string, variables_hash)
```

### Using Basic Authentication

Sometimes you'll want to connect to the API via Basic Authentication (i.e. username & password) instead of with an OAuth token, however the Github GraphQL API doesn't currently support this. It's fairly simple to do using the `octokit` gem:

```
#!/usr/bin/env ruby

require "octokit"
require "github/graphql"

octoclient = Octokit::Client.new(:login => username, :password => password)
auth = octoclient.create_authorization(:scopes => ["repo"], :note => "Test Script")

# Use this to connect to the GraphQL API
token = auth.attrs[:token]

# Don't forget to either store or delete the token, so your script can be run again!
IO.write('oauth.token', token)
octoclient.delete_authorization(auth.attrs[:id])
```

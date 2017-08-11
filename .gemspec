Gem::Specification.new do |s|
    s.name          = 'github-graphql'
    s.version       = IO.read('version.txt')
    s.license       = 'MIT'
    s.summary       = 'Github GraphQL API Query'
    s.description   = 'Send GraphQL API Requests to Github'
    s.homepage      = 'https://github.com/karagenit/github-graphql'
    s.author        = 'Caleb Smith'
    s.email         = 'karagenit@outlook.com'
    s.files         = ['lib/github/graphql.rb']
    s.require_paths = ['lib/']
    s.platform      = Gem::Platform::RUBY

    s.add_development_dependency 'rubocop',                     '~> 0.49'
    s.add_development_dependency 'bundler',                     '~> 1.15'
    s.add_development_dependency 'rake',                        '~> 12.0'
end

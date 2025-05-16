# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'airtable-client'
  spec.version = '0.1.1'
  spec.authors = 'Stuart Farnaby, Big Bear Studios'
  spec.license = 'MIT'
  spec.homepage = 'https://github.com/bigbearstudios-web/airtable-client-gem'
  spec.summary = 'A gem for querying the AirTable API'

  spec.required_ruby_version = '>= 3.2.0'

  spec.files = ['lib/airtable.rb']
  spec.files += Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '3.4.0'
  spec.add_development_dependency 'simplecov', '0.22.0'
end

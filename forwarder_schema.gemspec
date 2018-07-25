# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'forwarder_schema'
  s.version = '0.0.0'
  s.summary = 'Forwarder Schema'
  s.description = ' '

  s.authors = ['Julian Popescu']
  s.email = 'jpopesculian@gmail.com'
  s.homepage = ''
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  s.add_runtime_dependency 'forwarder_models'
  s.add_runtime_dependency 'graphql'
  s.add_runtime_dependency 'server_client'
end

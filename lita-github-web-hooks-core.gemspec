# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lita/github/web/hooks/core/version'

Gem::Specification.new do |spec|
  spec.name          = "lita-github-web-hooks-core"
  spec.version       = Lita::Github::WebHooks::Core::VERSION
  spec.authors       = ["Jim Van Fleet"]
  spec.email         = ["jim.van.fleet@levvel.io"]
  spec.description   = "First-class support for acting and sharing GitHub web hook activity for Lita"
  spec.summary       = "Lita Extension to leverage GitHub Web Hooks in your own handlers"
  spec.homepage      = "TODO: Add a homepage"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "extension" }

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.4"
  spec.add_runtime_dependency "netaddr", ">= 1.5.0"
  spec.add_runtime_dependency "i18n", ">= 0.6.9"
  spec.add_runtime_dependency "octokit", "~> 4.0.1"
  
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end

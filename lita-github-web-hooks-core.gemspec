# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lita/github/web/hooks/core/version'

Gem::Specification.new do |spec|
  spec.name          = "lita-github-web-hooks-core"
  spec.version       = Lita::Github::WebHooks::Core::VERSION
  spec.authors       = ["Jim Van Fleet"]
  spec.email         = ["jim.van.fleet@levvel.io"]
  spec.description   = "First-class support for GitHub web hooks in Lita"
  spec.summary       = "Lita extension to expose GitHub Web Hook events for use in your own handlers"
  spec.homepage      = "https://github.com/GetLevvel/lita-github-web-hooks-core"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "extension" }

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4.3"
  spec.add_runtime_dependency "netaddr", '~> 1.5', '>= 1.5.0'
  spec.add_runtime_dependency "i18n", '~> 0.6', '>= 0.6.9'
  spec.add_runtime_dependency "octokit", '~> 4.0', '>= 4.0.1'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug", '~> 3.3', ">= 3.3.0"
  spec.add_development_dependency "rack-test", '~> 0'
  spec.add_development_dependency "rspec", '~> 3.0', '>= 3.0.0'
end

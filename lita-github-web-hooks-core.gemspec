Gem::Specification.new do |spec|
  spec.name          = "lita-github-web-hooks-core"
  spec.version       = "0.1.0"
  spec.authors       = ["Jim Van Fleet"]
  spec.email         = ["jim.van.fleet@levvel.io"]
  spec.description   = "First-class support for acting and sharing GitHub web hook activity for Lita"
  spec.summary       = "Lita Extension to leverage GitHub Web Hooks in your own handlers"
  spec.homepage      = "TODO: Add a homepage"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "extension" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.4"
  spec.add_runtime_dependency "netaddr", ">= 1.5.0"
  spec.add_runtime_dependency "i18n", ">= 0.6.9"
  

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end

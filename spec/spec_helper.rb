require "lita-github-web-hooks-core"
require "lita/rspec"

Dir[File.join([File.dirname(__FILE__), 'support/**/*.rb'])].each { |f| require f }

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

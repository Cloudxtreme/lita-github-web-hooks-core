require "lita/extensions/github_web_hooks_core/configuration"
require "lita/extensions/github_web_hooks_core/configurator"

module Lita
  module Extensions
    class GithubWebHooksCore
      
    end

    # If your extension needs to register with a Lita hook, uncomment the
    # following line and change the hook name to the appropriate value:
    # Lita.register_hook(:hook_name, GithubWebHooksCore)
  end
end

require "lita/extensions/github_web_hooks_core/hook_receiver"
require "lita/extensions/github_web_hooks_core/hooks"
require "lita/extensions/github_web_hooks_core/listeners"
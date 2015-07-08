module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Fork < Hook
      end
    end
    Configuration.register_hook("fork", GitHubWebHooksCore::Hooks::Fork)
  end
end

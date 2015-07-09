module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Repository < Hook
      end
    end
    Configuration.register_hook("repository", GitHubWebHooksCore::Hooks::Repository)
  end
end

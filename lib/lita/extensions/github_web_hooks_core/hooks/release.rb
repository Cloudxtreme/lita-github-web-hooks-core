module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Release < Hook
      end
    end
    Configuration.register_hook("release", GitHubWebHooksCore::Hooks::Release)
  end
end

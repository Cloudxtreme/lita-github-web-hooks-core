module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Issues < Hook
      end
    end
    Configuration.register_hook("issues", GitHubWebHooksCore::Hooks::Issues)
  end
end

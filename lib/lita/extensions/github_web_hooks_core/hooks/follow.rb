module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Follow < Hook
      end
    end

    Configuration.register_hook("follow", GitHubWebHooksCore::Hooks::Follow)
  end
end

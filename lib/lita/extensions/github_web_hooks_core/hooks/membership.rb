module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Membership < Hook
      end
    end
    Configuration.register_hook("membership", GitHubWebHooksCore::Hooks::Membership)
  end
end

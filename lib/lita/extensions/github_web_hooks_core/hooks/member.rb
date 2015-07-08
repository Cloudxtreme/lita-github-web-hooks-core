module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Member < Hook
      end
    end
    Configuration.register_hook("member", GitHubWebHooksCore::Hooks::Member)
  end
end

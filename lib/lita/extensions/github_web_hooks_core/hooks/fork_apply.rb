module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class ForkApply < Hook
      end
    end
    Configuration.register_hook("fork_apply", GitHubWebHooksCore::Hooks::ForkApply)
  end
end

module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Delete < Hook
      end
    end
    Configuration.register_hook("delete", GitHubWebHooksCore::Hooks::Delete)
  end
end

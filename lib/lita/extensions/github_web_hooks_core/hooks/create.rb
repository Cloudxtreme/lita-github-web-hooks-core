module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Create < Hook
      end
    end
    Configuration.register_hook("create", GitHubWebHooksCore::Hooks::Create)
  end
end

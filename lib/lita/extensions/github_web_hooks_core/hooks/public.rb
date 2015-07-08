module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Public < Hook
      end
    end
    Configuration.register_hook("public", GitHubWebHooksCore::Hooks::Public)
  end
end

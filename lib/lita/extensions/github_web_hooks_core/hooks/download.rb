module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Download < Hook
      end
    end
    Configuration.register_hook("download", GitHubWebHooksCore::Hooks::Download)
  end
end

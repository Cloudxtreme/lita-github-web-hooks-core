module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Gist < Hook
      end
    end

    Configuration.register_hook("gist", GitHubWebHooksCore::Hooks::Gist)
  end
end

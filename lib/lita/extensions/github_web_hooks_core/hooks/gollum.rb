module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Gollum < Hook
      end
    end

    Configuration.register_hook("gollum", GitHubWebHooksCore::Hooks::Gollum)
  end
end

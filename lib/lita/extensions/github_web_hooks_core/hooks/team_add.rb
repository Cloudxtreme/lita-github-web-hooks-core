module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class TeamAdd < Hook
      end
    end
    Configuration.register_hook("team_add", GitHubWebHooksCore::Hooks::TeamAdd)
  end
end

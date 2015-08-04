module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class TeamAdd < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def org
          payload["organization"]["login"]
        end
        def team_name
          payload["team"]["name"]
        end
        def attributes
          {
            org: org,
            team_name: team_name,
            repository: repository,
            repo: repo
          }
        end
      end
    end
  end
end

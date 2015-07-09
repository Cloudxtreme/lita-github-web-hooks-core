module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Membership < Hook
        def admin
          payload["sender"]["login"]
        end
        def addition
          payload["member"]["login"]
        end
        def org
          payload["organization"]["login"]
        end
        def team_name
          payload["team"]["name"]
        end
        def attributes
          {
            admin: admin,
            addition: addition,
            org: org,
            team_name: team_name
          }
        end
      end
    end
    Configuration.register_hook("membership", GitHubWebHooksCore::Hooks::Membership)
  end
end

module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Member < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks        
        def admin
          payload["sender"]["login"]
        end
        def addition
          payload["member"]["login"]
        end
        def attributes
          {
            admin: admin,
            addition: addition,
            repository: repository,
            repo: repo
          }
        end
      end
    end
    Configuration.register_hook("member", GitHubWebHooksCore::Hooks::Member)
  end
end

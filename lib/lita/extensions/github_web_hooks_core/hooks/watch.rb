module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Watch < Hook
        
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks        

        def user
          payload["sender"]["login"]
        end
        
        def attributes
          {
            user: user,
            repository: repository,
            repo: repo
          }
        end
      end
    end
  end
end

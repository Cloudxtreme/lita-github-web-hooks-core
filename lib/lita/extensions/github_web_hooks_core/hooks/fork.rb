module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Fork < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def forker
          payload["sender"]["login"]          
        end
        def source
          payload["forkee"]["full_name"]
        end
        def target
          repo
        end
        def attributes
          {
            forker: forker,
            source: source,
            target: target
          }
        end        
      end
    end
  end
end

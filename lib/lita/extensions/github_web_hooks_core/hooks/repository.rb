module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Repository < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def creator
          payload["sender"]["login"]
        end
        def attributes
          {
            creator: creator,
            repository: repository,
            repo: repo
          }
        end
      end
    end
  end
end

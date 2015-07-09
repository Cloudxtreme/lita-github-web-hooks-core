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
    Configuration.register_hook("repository", GitHubWebHooksCore::Hooks::Repository)
  end
end

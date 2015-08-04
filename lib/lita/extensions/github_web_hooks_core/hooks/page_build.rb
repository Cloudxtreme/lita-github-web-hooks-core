module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class PageBuild < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def status
          payload["build"]["status"]
        end
        def attributes
          {
            status: status,
            repository: repository,
            repo: repo
          }
        end
      end
    end
  end
end

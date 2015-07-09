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
    Configuration.register_hook("page_build", GitHubWebHooksCore::Hooks::PageBuild)
  end
end

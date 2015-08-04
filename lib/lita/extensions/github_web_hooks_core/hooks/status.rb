module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Status < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def sha
          payload["sha"]
        end
      
        def status
          payload["state"]
        end
      
        def context
          payload["context"]
        end
      
        def description
          payload["description"]
        end
      
        def attributes
          {
            sha: sha,
            context: context,
            description: description,
            repo: repo,
            status: status
          }
        end
      end
    end
  end
end

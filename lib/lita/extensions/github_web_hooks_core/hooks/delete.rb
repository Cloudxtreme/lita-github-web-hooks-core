module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Delete < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def deletor
          payload["sender"]["login"]          
        end
        def deletion
          payload["ref_type"]
        end
        def deletion_name
          payload["ref"]
        end
        def attributes
          {
            deletor: deletor,
            deletion: deletion,
            deletion_name: deletion_name,
            repository: repository,
            repo: repo
          }
        end
      end
    end
    Configuration.register_hook("delete", GitHubWebHooksCore::Hooks::Delete)
  end
end

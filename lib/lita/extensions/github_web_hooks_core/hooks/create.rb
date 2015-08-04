module Lita::Extensions
  module GitHubWebHooksCore
    module Hooks
      class Create < Hook
        include Lita::Extensions::GitHubWebHooksCore::Hooks::RepoHooks
        def creator
          payload["sender"]["login"]          
        end
        def creation
          payload["ref_type"]
        end
        def creation_name
          payload["ref"]
        end
        def attributes
          {
            creator: creator,
            creation: creation,
            creation_name: creation_name,
            repository: repository,
            repo: repo
          }
        end
      end
    end
  end
end
